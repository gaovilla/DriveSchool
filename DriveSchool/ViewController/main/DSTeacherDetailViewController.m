//
//  DSTeacherDetailViewController.m
//  DriveSchool
//
//  Created by 张学成 on 15/3/5.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSTeacherDetailViewController.h"

@interface DSTeacherDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UITextView *addressField;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UITextView *teacherInfoTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableDictionary *teacherInfo;
@property (weak, nonatomic) IBOutlet UIView *teacherInfoView;
@property (weak, nonatomic) IBOutlet UIView *infoVoew;




@end

@implementation DSTeacherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setDefaultValue];
    
}
-(void)setDefaultValue{
    self.title = @"教练信息";
    _teacherInfoView.layer.borderWidth = 1;
    _teacherInfoView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _infoVoew.layer.borderWidth = 1;
    _infoVoew.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    [_scrollView setContentSize:CGSizeMake(CURRENT_WIDTH, 800)];
    [self initTeacherInfo];
    
}
-(void)initTeacherInfo{
    _teacherInfo = [self.passedParams objectForKey:@"teacherInfo"];
    _nameLabel.text = [_teacherInfo objectForKey:@"name"];
    _moneyLabel.text = [_teacherInfo objectForKey:@"money"];
    _telLabel.text = [_teacherInfo objectForKey:@"tel"];
    _addressField.text = [_teacherInfo objectForKey:@"address"];
    _teacherInfoTextView.text = [_teacherInfo objectForKey:@"introduce"];
    
    _addressField.editable = NO;
}
- (IBAction)clickCallButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[NSString alloc]initWithFormat:@"telprompt://%@",[_teacherInfo objectForKey:@"tel"]]]];
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
