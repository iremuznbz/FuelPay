//
//  Location.h
//  FuelPay
//
//  Created by irem uzunbaz on 5/12/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSString * locationDescription;
@property (nonatomic, retain) NSNumber * locationLongitude;
@property (nonatomic ,retain) NSNumber * locationLatitude;

@end
