//
//  NavigationViewController.h
//  SlideOutMenu
//
//  Created by Jared Davidson on 7/14/14.
//  Copyright (c) 2014 Archetapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *theTable;
    NSMutableArray *theArray;
}
@property (weak, nonatomic) IBOutlet UITableViewCell *friendRequest;
@property (weak, nonatomic) IBOutlet UITableViewCell *profile;
@property (strong, nonatomic) IBOutlet UIView *logout;

@end
