//
//  ViewController.m
//  SlideOutMenu
//
//  Created by Jared Davidson on 7/14/14.
//  Copyright (c) 2014 Archetapp. All rights reserved.
//

#import "menuViewController.h"
#import "SWRevealViewController.h"


@interface menuViewController ()
{
    NSArray *friend;
}
@end

@implementation menuViewController
@synthesize regName,regphonenumber;
NSString *regname=@"";
NSString *regpho=@"";
NSString *grouptitle;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)regPhone:(id)sender {
    regpho = regphonenumber.text;
    NSLog(@"Registered Phone Numner: %@",regpho);
//    NSString *sendConfirmationCodeDetails = [NSString stringWithFormat:@"www.trykipup.com/api/v1/users/request_login_pin?phone_number=%@",pno];
//    [self apicallpost:sendConfirmationCodeDetails];
    
    
}
-(void) fetchFriendsDetails
{
    friendlist = [[NSMutableArray alloc] init];
    
    NSArray *data = [NSArray arrayWithObjects:@"Friend1",@"Friend2",@"Friend2",@"Friend3",nil];
    
    for (int i=0; i < data.count; i++) {
        [friendlist addObject:data[i]];
        
    }
    
}

#pragma mark - Table view data source

#pragma tableview datasource and delegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;//[groupArray count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [friendlist count];
}
/*
 -(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
 {
 return cell;
 }*/
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifier = @"friendcell";
    UITableViewCell *friendcell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!friendcell) {
        friendcell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    friendcell.textLabel.text = [friendlist objectAtIndex:indexPath.row];
    return friendcell;
}

#pragma mark - Table view delegate
/*
-(void) tableVIew:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        
}
*/

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
    
    
    
}




@end
