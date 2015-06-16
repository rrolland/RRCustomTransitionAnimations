//
//  RRSecondViewController.m
//  RRCustomViewControllerTransitions
//
//  Created by Romain Rolland on 15/06/2015.
//  Copyright (c) 2015 rro. All rights reserved.
//

#import "RRSecondViewController.h"

@interface RRSecondViewController ()

@end

@implementation RRSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)closeViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
