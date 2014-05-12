//
//  DetailViewController.h
//  FuelPay
//
//  Created by irem uzunbaz on 5/10/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
