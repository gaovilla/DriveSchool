//
//  DSNewStudentViewController.m
//  DriveSchool
//
//  Created by 张学成 on 15/3/4.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSNewStudentViewController.h"

@interface DSNewStudentViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DSNewStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setDefaultValue];
}
-(void)setDefaultValue{
    self.title = @"新手驾到";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
