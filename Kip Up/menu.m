//
//  ViewController.m
//  Kip Up
//
//  Created by Jainam on 18/09/15.
//  Copyright (c) 2015 Kip Up. All rights reserved.
//

#import "menu.h"
#import <Foundation/Foundation.h>
#import "SWRevealViewController.h"

@interface menu ()

@end

@implementation menu

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
