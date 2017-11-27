//
//  SecondViewController.m
//  HMW_UserInterAnim
//
//  Created by Константин on 27.11.17.
//  Copyright © 2017 Konstantin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    self.gestRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandle:)];

    [self.view addGestureRecognizer: self.gestRec];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) gestureHandle: (UIPanGestureRecognizer*) gestRec
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
