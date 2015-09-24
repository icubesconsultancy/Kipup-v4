//
//  ViewController.m
//  Kip Up
//
//  Created by Jainam on 18/09/15.
//  Copyright (c) 2015 Kip Up. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize firstname,lastname,phonenumber,emailid,confirmationCode;
NSString *fname=@"";
NSString *lname=@"";
NSString *pno=@"";
NSString *eid=@"";
NSString *ccode=@"";


- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) apicallpost:url
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        
                                                        if(data != nil)
                                                        {
                                                            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                           options:NSJSONReadingMutableContainers
                                                                                                                             error:nil];
                                                            if (dataDictionary != nil) {
                                                                
                                                                NSString *dataDictionaryDetails = dataDictionary[@"message"];
                                                                NSLog(@"got details.......%@,%@",url,dataDictionaryDetails);
                                                            }
                                                        }
                                                        
                                                        NSLog(@"response :......%@", httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}



- (IBAction)homeNext:(id)sender {
    fname = firstname.text;
    lname = lastname.text;
 
}
- (IBAction)registerNext:(id)sender {
    
    
    pno = phonenumber.text;
    eid = emailid.text;
    
    fname = @"shashank";
    lname = @"rana";
    NSLog(@"First name from UI:%@",fname);
    NSLog(@"Last name from UI:%@",lname);
    NSLog(@"Phone Number from UI:%@",pno);
    NSLog(@"Email Address from UI:%@",eid);
    NSString *registeration = [NSString stringWithFormat:@"http://www.trykipup.com/api/v1/users/register?first_name=%@&last_name=%@&phone_number=%@&email=%@",fname,lname,pno,eid];
    
    [self apicallpost:registeration];
    NSString *sendConfirmationCodeDetails = [NSString stringWithFormat:@"www.trykipup.com/api/v1/users/request_login_pin?phone_number=%@",pno];
    [self apicallpost:sendConfirmationCodeDetails];
    

}


- (IBAction)confirmNext:(id)sender {
    
    ccode = confirmationCode.text;
    NSLog(@"Confirmation Code: %@",ccode);
    NSString *verified = [NSString stringWithFormat:@"www.trykipup.com/api/v1/users/login_with_pin?pin_code=%@&phone_number=%@",ccode,pno];
    [self apicallpost:verified];
    
    
}
- (IBAction)sendAgain:(id)sender {
    NSString *sendConfirmationCodeDetails = [NSString stringWithFormat:@"www.trykipup.com/api/v1/users/request_login_pin?phone_number=%@",pno];
    [self apicallpost:sendConfirmationCodeDetails];
    
}


-(void) apicallget:url
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}

- (IBAction)registeredPhone:(id)sender {
    pno = phonenumber.text;
    NSLog(@"Phone Number from UI:%@",pno);
    
    NSString *sendConfirmationCodeDetails = [NSString stringWithFormat:@"www.trykipup.com/api/v1/users/request_login_pin?phone_number=%@",pno];
    [self apicallpost:sendConfirmationCodeDetails];
    
}
@end
