//
//  MapViewController.h
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//
#import "Location.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "GMDirectionService.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *myNavigateButton;

- (IBAction)NavigateButton:(id)sender;
-(CLLocationCoordinate2D)getGPSLocation;
@property (strong,nonatomic) Location *selected;
@property (strong,nonatomic) GMSMapView *mapView;

@end
