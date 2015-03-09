//
//  DSMainSubjectViewController.m
//  DriveSchool
//
//  Created by 张学成 on 15/3/3.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSMainSubjectViewController.h"
#import "DSNewSubjectTwoViewController.h"
#import "DSNewSubjectOneViewController.h"
#import "SCNavTabBarController.h"

@interface DSMainSubjectViewController ()

@end

@implementation DSMainSubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setSubjectViews];
}
-(void)setSubjectViews{
    self.navigationController.navigationBar.translucent = NO;

    
    UIViewController *subjectOne = [self getViewControllerFromStoryBoard:@"DSNewSubjectOneViewController"];
    subjectOne.title = @"科目一";
    
    UIViewController *subjectTwo = [self getViewControllerFromStoryBoard:@"DSNewSubjectTwoViewController"];
    subjectTwo.title = @"科目二";
    
    UIViewController *subjectThree = [self getViewControllerFromStoryBoard:@"DSNewSubjectThreeViewController"];
    subjectThree.title = @"科目三";
    
    UIViewController *subjectFour = [self getViewControllerFromStoryBoard:@"DSNewSubjectFourViewController"];
    subjectFour.title = @"科目四";
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
//    NSMutableArray *array = [[NSMutableArray alloc]init];
//    for (int i; i<5; i++) {
//        [array addObject:subjectOne];
//        i++;
//    }
    navTabBarController.subViewControllers = @[subjectOne, subjectTwo,subjectThree,subjectFour];
//    navTabBarController.subViewControllers = [[NSArray alloc]initWithArray:array];
    navTabBarController.navTabBarColor = [UIColor whiteColor];
//        navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
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
