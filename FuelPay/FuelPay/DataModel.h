//
//  DataModel.h
//  FuelPay
//
//  Created by irem uzunbaz on 5/13/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface DataModel : NSManagedObject

@property(nonatomic,strong) NSNumber *inputKM;
@property(nonatomic,strong) NSNumber *inputTL;

@end
