//
//  TableViewController.h
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TableViewController : UITableViewController <CLLocationManagerDelegate>

-(void) parseJSON;
-(CLLocationCoordinate2D) getGPSLocation;

@property(nonatomic,strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)displayMap:(id)sender;
@end
