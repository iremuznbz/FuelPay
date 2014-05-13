//
//  ConsumptionViewController.m
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import "ConsumptionViewController.h"
#import "DataModel.h"

@interface ConsumptionViewController ()

@end

@implementation ConsumptionViewController
@synthesize kmField,tlField,sendButton,managedObjectContext,results;
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

- (IBAction)sendInfo:(id)sender {
    
    NSString *inputKM,*inputTL;
    inputKM = [[NSString alloc]initWithString:[kmField text]];
    inputTL =[[NSString alloc]initWithString:[tlField text]];
    
    NSLog(@"inputKM:%@",inputKM);
    NSLog(@"inputTL:%@",inputTL);
    
    [sendButton setHidden:YES];
    
    
    DataModel *myInputs = (DataModel*)[NSEntityDescription insertNewObjectForEntityForName:@"Statistics" inManagedObjectContext:[self managedObjectContext]];
                                       
    [myInputs setValue:inputKM forKey:@"inputKM"];
    [myInputs setValue:inputTL forKey:@"inputTL"];
    
    


}

- (IBAction)showStatistics:(id)sender {
}
- (IBAction)resignButton:(id)sender {
    
    [kmField resignFirstResponder];
    [tlField resignFirstResponder];
}
@end
