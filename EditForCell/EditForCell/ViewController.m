//
//  ViewController.m
//  EditForCell
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "ViewController.h"
#import "NewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    
    
    
}

- (IBAction)edit:(id)sender {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[NewController alloc] init]];
    nav.navigationBar.barTintColor = [UIColor blackColor];
    nav.navigationBar.tintColor = [UIColor whiteColor];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
