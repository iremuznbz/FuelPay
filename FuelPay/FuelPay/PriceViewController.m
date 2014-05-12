//
//  PriceViewController.m
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import "PriceViewController.h"

@interface PriceViewController ()

@end

@implementation PriceViewController
{
        NSMutableArray *costs;
}
@synthesize label1,label2,label3,label4,label5,label6,price1,price2,price3,price4,price5,price6;

-(void)getPrice{
    
    NSError *error;
    
    
    NSData *costsData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://api.piyasa.com/json/?kaynak=akaryakit_guncel_poas_Ankara"]];
    
    
    costs = [NSJSONSerialization JSONObjectWithData:costsData options:NSJSONReadingMutableContainers error:&error];
    
    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [price1 setText:[[costs objectAtIndex:0] objectForKey:@"price"]];
    [price2 setText:[[costs objectAtIndex:1] objectForKey:@"price"]];
    [price3 setText:[[costs objectAtIndex:2] objectForKey:@"price"]];
    [price4 setText:[[costs objectAtIndex:3] objectForKey:@"price"]];
    [price5 setText:[[costs objectAtIndex:4] objectForKey:@"price"]];
    [price6 setText:[[costs objectAtIndex:5] objectForKey:@"price"]];
    
    [label1 setText:[[costs objectAtIndex:0] objectForKey:@"fuel"]];
    [label2 setText:[[costs objectAtIndex:1] objectForKey:@"fuel"]];
    [label3 setText:[[costs objectAtIndex:2] objectForKey:@"fuel"]];
    [label4 setText:[[costs objectAtIndex:3] objectForKey:@"fuel"]];
    [label5 setText:[[costs objectAtIndex:4] objectForKey:@"fuel"]];
    [label6 setText:[[costs objectAtIndex:5] objectForKey:@"fuel"]];
    
    
    
    for(NSDictionary *fuel in costs){
        NSLog(@"fuel:%@",fuel[@"fuel"]);
    }
    
    
}

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
    // Do any additional setup after loading the view.
    [self getPrice];
    
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
