//
//  DSTeacherDetailViewController.m
//  DriveSchool
//
//  Created by 张学成 on 15/3/5.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSTeacherDetailViewController.h"

@interface DSTeacherDetailViewController ()<UIScrollViewDelegate>
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
@property (weak, nonatomic) IBOutlet UIScrollView *bannerScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSTimer *bannerTimer;
@property (strong, nonatomic) NSMutableArray *bannerArray;


@end

@implementation DSTeacherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setDefaultValue];
    [self initBanner];
    
}
-(void)setDefaultValue{
    self.title = @"教练信息";
    _teacherInfoView.layer.borderWidth = 1;
    _teacherInfoView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _infoVoew.layer.borderWidth = 1;
    _infoVoew.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
   
    
    [self initTeacherInfo];
    //要计算教练简介的高度来设置
    //因为要去除不滑动显示的内容高度,所以减去50
    CGFloat height  = [AppUtil heightForString:[_teacherInfo objectForKey:@"introduce"] fontSize:17.0 andWidth:290]-50;
    
    [_scrollView setContentSize:CGSizeMake(CURRENT_WIDTH, CURRENT_HEIGHT+200)];
}
-(void)initBanner{
    _bannerArray = [[NSMutableArray alloc]init];
    NSDictionary *bannerOne = @{@"image":@"icon_main_banner_one.png",@"url":@"http://baidu.com"};
    NSDictionary *bannerTwo = @{@"image":@"icon_main_banner_four.jpg",@"url":@"http://baidu.com"};
    [_bannerArray addObject:bannerOne];
    [_bannerArray addObject:bannerTwo];
    [_bannerScrollView setContentSize:CGSizeMake(CURRENT_WIDTH*_bannerArray.count, 160)];
    
    for (int i = 0; i < _bannerArray.count; i++) {
        NSDictionary *dic = [_bannerArray objectAtIndex:i];
        NSString *imageName = [dic nonNullValueForKey:@"image"];
        UIButton *bannerBtn = [[UIButton alloc]initWithFrame:CGRectMake(i*CURRENT_WIDTH, 0, CURRENT_WIDTH, 160)];
        [bannerBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        [_bannerScrollView addSubview:bannerBtn];
    }
    
    [_pageControl setNumberOfPages:_bannerArray.count];
    if(!_bannerTimer){
        _bannerTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(bannerAutoScroll) userInfo:nil repeats:YES];
    }
}
-(void)bannerAutoScroll{
    NSInteger bannerCount = _pageControl.numberOfPages;
    NSInteger currentPage = _pageControl.currentPage;
    if (currentPage < bannerCount-1) {
        CGPoint point = CGPointMake(CURRENT_WIDTH*currentPage+CURRENT_WIDTH,0);
        [_bannerScrollView setContentOffset:point animated:YES];
        [_pageControl setCurrentPage:currentPage+1];
    }else if(currentPage+1 == bannerCount){
        CGPoint point = CGPointMake(0,0);
        [_bannerScrollView setContentOffset:point animated:YES];
        [_pageControl setCurrentPage:0];
    }
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
