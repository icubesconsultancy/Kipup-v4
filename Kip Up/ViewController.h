//
//  ViewController.h
//  Kip Up
//
//  Created by Jainam on 18/09/15.
//  Copyright (c) 2015 Kip Up. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>{
    
 }



@property (strong, nonatomic) IBOutlet UITextField *firstname;
@property (strong, nonatomic) IBOutlet UITextField *lastname;
@property (strong, nonatomic) IBOutlet UIButton *homePageButton;
- (IBAction)homeNext:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *phonenumber;
@property (strong, nonatomic) IBOutlet UITextField *emailid;
@property (strong, nonatomic) IBOutlet UIView *registeredPhoneButton;
- (IBAction)registeredPhone:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *registerPageButton;
- (IBAction)registerNext:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *confirmationCode;
@property (strong, nonatomic) IBOutlet UIButton *confirmNextButton;
- (IBAction)confirmNext:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *sendAgainButton;
- (IBAction)sendAgain:(id)sender;









@end

