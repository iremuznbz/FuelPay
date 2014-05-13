//
//  RouteViewController.h
//  FuelPay
//
//  Created by irem uzunbaz on 5/14/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <MapKit/MapKit.h>
#import "GMDirectionService.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import "DataModel.h"

@interface RouteViewController : UIViewController

-(void) drawingRoute;
@end
