
//
//  StatisticsViewController.m
//  dene
//
//  Created by irem uzunbaz on 4/16/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import "StatisticsViewController.h"

@interface StatisticsViewController ()

@end


@implementation StatisticsViewController
@synthesize statisticsKM,statisticsTL,statistics;
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
    NSMutableString *mystring = [[NSMutableString alloc]initWithString:statisticsKM];
    [mystring appendString:@"TL="];
    [mystring appendString:statisticsTL];
    
    [statistics setText:mystring];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
