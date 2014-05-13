//
//  TableViewController.m
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import "TableViewController.h"
#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

#define PlaceURLString @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=%f&types=gas_station&sensor=true&key=AIzaSyAr69JMslZOMESBjDH2EB1tqeKBW11oiqg"



@interface TableViewController ()

@end

@implementation TableViewController
{

    NSDictionary *fuelLocationDictionary;
    NSDictionary *jsonLocationDictionary;
    NSArray *locations;
    CLLocationCoordinate2D newLocCoordinate;
    CLLocationManager *locationManager;
    
}


-(void) parseJSON{
    
    
    
    [self googlePlace];
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self parseJSON];


   



}

-(CLLocationCoordinate2D)getGPSLocation{
    
    CLLocationCoordinate2D coordinate;
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
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

-(void)googlePlace
{

    newLocCoordinate = [self getGPSLocation];
    NSLog(@"google it %f %f",newLocCoordinate.longitude,newLocCoordinate.latitude);
    [self accessGooglePlaceAPI:5000 latitude:newLocCoordinate.latitude longitude:newLocCoordinate.longitude];
    
}

-(void)accessGooglePlaceAPI:(CGFloat)radius latitude:(CGFloat)lat longitude:(CGFloat)lon
{
    NSError *error;
    NSString *urlString = [NSString stringWithFormat:PlaceURLString,lat,lon,radius];
    NSURL *googlePlacesURL = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *jsonData = [NSData dataWithContentsOfURL:googlePlacesURL];
    jsonLocationDictionary =[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
        return;
    }
    else
        NSLog(@"Parsing is succesfull!");

    
    NSLog(@"==========================");
    
//    NSLog(@"%@",jsonLocationDictionary);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [[jsonLocationDictionary objectForKey:@"results"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    
    
    cell.textLabel.text = [[[jsonLocationDictionary objectForKey:@"results"] objectAtIndex:indexPath.row]objectForKey:@"name"];

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UINavigationController * navCont = [self navigationController];
    MapViewController *controller = [[MapViewController alloc]init];
    
    controller.receivedName = [[[jsonLocationDictionary objectForKey:@"results"]objectAtIndex:(int)[indexPath row]] objectForKey:@"name"];
    
    controller.receivedLon = [[[[[jsonLocationDictionary objectForKey:@"results"]objectAtIndex:(int)[indexPath row]] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"];
    
    controller.receivedLat = [[[[[jsonLocationDictionary objectForKey:@"results"]objectAtIndex:(int)[indexPath row]] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"];
    
    NSLog(@"name:%@",controller.receivedName);
    NSLog(@"lat:%@",controller.receivedLat);
    NSLog(@"lont:%@",controller.receivedLon);
    NSLog(@"===============================");
    
    [navCont pushViewController:controller animated:YES];
    

    
    
    
    
}

- (IBAction)displayMap:(id)sender {
    
    UINavigationController * navCont = [self navigationController];
    MapViewController* controller = [[MapViewController alloc]init];

    [navCont pushViewController:controller animated:YES];
    
}
@end
