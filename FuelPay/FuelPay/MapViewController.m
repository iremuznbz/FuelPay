//
//  MapViewController.m
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#define METERS_PER_MILE 1609.344
#import "MapViewController.h"


static NSString *apiKey =@"";

@interface MapViewController ()

@end


@implementation MapViewController {
    CLLocationManager *locationManager;
    NSData *mapData;
    NSDictionary *mapDictionary;
    NSString *requestURL;
    CLLocationCoordinate2D userCoord;
}

@synthesize selected,mapView;

@synthesize receivedLat,receivedLon,receivedName;



-(CLLocationCoordinate2D)getGPSLocation {

    CLLocationCoordinate2D coordinate;
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate =self;
    if(CLLocationManager.locationServicesEnabled) {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = 5.0f;
        [locationManager startUpdatingLocation];
    }
    NSLog(@"current location:%f",locationManager.location.coordinate.latitude);
    NSLog(@"current location:%f",locationManager.location.coordinate.longitude);
    coordinate.latitude = locationManager.location.coordinate.latitude;
    coordinate.longitude = locationManager.location.coordinate.longitude;
  
    return coordinate;

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:@"Routes" style:UIBarButtonItemStyleBordered target:self action:@selector(drawRoute)];
    self.navigationItem.rightBarButtonItem = button;
    
     userCoord = [self getGPSLocation]; // camera will zoom user location with these datas
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[receivedLat floatValue]
                                                            longitude:[receivedLon floatValue]
                                                                 zoom:4];
    mapView = [GMSMapView mapWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 40) camera:camera];
    [mapView setMyLocationEnabled:YES];

    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    marker.snippet = receivedName;
    marker.map = mapView;
    
    
    /*
     GMSMutablePath *path = [GMSMutablePath path];
     [path addLatitude:-33.866 longitude:151.195]; // Sydney
     [path addLatitude:-18.142 longitude:178.431]; // Fiji
     [path addLatitude:21.291 longitude:-157.821]; // Hawaii
     [path addLatitude:37.423 longitude:-122.091]; // Mountain View
     
     GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
     polyline.strokeColor = [UIColor blueColor];
     polyline.strokeWidth = 5.f;
     polyline.map = mapView;
     */
    
    [self.view addSubview:mapView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *) stringByStrippingHTML:(NSString*)s {
    NSRange r;
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

- (void) drawRoute {

    
    
    NSString *startPos =[NSString stringWithFormat:@"%f,%f",userCoord.latitude,userCoord.longitude];
    NSString *endPos =[NSString stringWithFormat:@"%@,%@",receivedLat,receivedLon];
    
    [[GMDirectionService sharedInstance] getDirectionsFrom:startPos to:endPos succeeded:^(GMDirection *directionResponse) {
        if ([directionResponse statusOK]){
            NSArray *routes = [[directionResponse directionResponse] objectForKey:@"routes"];
            
            GMSPath *path = [GMSPath pathFromEncodedPath:routes[0][@"overview_polyline"] [@"points"]];
            GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
            polyline.strokeColor = [UIColor blueColor];
            polyline.strokeWidth = 3.f;
            polyline.map = mapView;
            NSArray *steps =[[[[routes objectAtIndex:0] objectForKey:@"legs"] objectAtIndex:0] objectForKey:@"steps"];
            
            
            for (NSDictionary*dict in steps) {
                NSLog(@"%@", [self stringByStrippingHTML:[dict objectForKey:@"html_instructions"]]);
                
            }
            
            NSLog(@"steps%@",steps);
        }
        NSLog(@"direction response:%@ from:%@ to:%@",directionResponse.status,startPos,endPos);
    } failed:^(NSError *error) {
        NSLog(@"Can't reach the server");
    }];

    
}


@end
