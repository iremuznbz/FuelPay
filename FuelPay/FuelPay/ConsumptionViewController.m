//
//  ConsumptionViewController.m
//  dene
//
//  Created by irem uzunbaz on 4/6/14.
//  Copyright (c) 2014 irem uzunbaz. All rights reserved.
//

#import "ConsumptionViewController.h"
#import "StatisticsViewController.h"
#import "DataModel.h"

@interface ConsumptionViewController ()

@end

@implementation ConsumptionViewController{
        NSString *inputKM1,*inputTL1;
}
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


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)sendInfo:(id)sender {
    

    inputKM1 = [[NSString alloc]initWithString:[kmField text]];
    inputTL1 =[[NSString alloc]initWithString:[tlField text]];
    
    NSLog(@"inputKM:%@",inputKM1);
    NSLog(@"inputTL:%@",inputTL1);
    
   [sendButton setHidden:YES];
  /*
    
    DataModel *myInputs = (DataModel*)[NSEntityDescription insertNewObjectForEntityForName:@"Statistics" inManagedObjectContext:[self managedObjectContext]];
                                       
    [myInputs setValue:[kmField text] forKey:@"inputKM"];
    [myInputs setValue:[tlField text] forKey:@"inputTL"];
    
    */


}

-(void)fetchData{
    
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Statistics" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
        NSError *error;
        NSArray *results=[self.managedObjectContext executeFetchRequest:request error:&error];
    
    
        for (DataModel *l in results) {
            NSLog(@"KM: %@",l.inputKM);
            NSLog(@"TL: %@",l.inputTL);
    
        }
    
    
    
    
}

- (IBAction)showStatistics:(id)sender {
    
    UINavigationController * navCont = [self navigationController];
    StatisticsViewController *controller = [[StatisticsViewController alloc]init];
    controller.statisticsKM = inputKM1;
    controller.statisticsTL = inputTL1;
    [navCont pushViewController:controller animated:YES];
    
}
- (IBAction)resignButton:(id)sender {
    
    [kmField resignFirstResponder];
    [tlField resignFirstResponder];
}
@end
