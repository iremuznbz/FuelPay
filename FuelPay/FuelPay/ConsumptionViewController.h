//
//  ConsumptionViewController.h
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface ConsumptionViewController : UIViewController
- (IBAction)resignButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *kmField;
@property (weak, nonatomic) IBOutlet UITextField *tlField;
- (IBAction)sendInfo:(id)sender;
- (IBAction)showStatistics:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property(nonatomic,strong) NSArray *results;
@end
