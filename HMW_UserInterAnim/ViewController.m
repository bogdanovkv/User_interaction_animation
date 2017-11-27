//
//  ViewController.m
//  HMW_UserInterAnim
//
//  Created by Константин on 27.11.17.
//  Copyright © 2017 Konstantin. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (strong,nonatomic) UIButton *nextButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.nextButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.nextButton.backgroundColor = UIColor.redColor;
    
    [self.nextButton addTarget:self action:@selector(nextController) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview: self.nextButton];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) nextController
{
    SecondViewController *svc = [SecondViewController new];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
