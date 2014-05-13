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
#import "DataModel.h"

@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>


-(CLLocationCoordinate2D)getGPSLocation;
-(void) drawRoute;
@property (strong,nonatomic)  Location *selected;
@property (strong,nonatomic) GMSMapView *mapView;

@property (strong,nonatomic) NSString *receivedName;
@property (strong,nonatomic) NSNumber *receivedLat;
@property (strong,nonatomic) NSNumber *receivedLon;

@end
