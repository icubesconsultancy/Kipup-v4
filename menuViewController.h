//
//  ViewController.h
//  SlideOutMenu
//
//  Created by Jared Davidson on 7/14/14.
//  Copyright (c) 2014 Archetapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *friends;
    NSMutableArray *friendlist;

}

@property (weak,nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (strong, nonatomic) IBOutlet UITextField *regName;

@property (strong, nonatomic) IBOutlet UITextField *regphonenumber;
@property (strong, nonatomic) IBOutlet UIButton *regPhoneButton;
- (IBAction)regPhone:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationItem *Grouptitle;




@end
