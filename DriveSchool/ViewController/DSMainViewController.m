//
//  DSMainViewController.m
//  DriveSchool
//
//  Created by 张学成 on 15/2/8.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSMainViewController.h"
#import "DSMainTableViewCell.h"

@interface DSMainViewController ()<UITableViewDelegate,UIScrollViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic) NSTimer *timer;                 //自动滚屏timer
@property (weak, nonatomic) IBOutlet UIScrollView *bannerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *tableItems;
@property (strong, nonatomic) NSMutableArray *bannerArray;


@end

@implementation DSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultValue];
    [self initFrame];
    [self initBanner];
}
-(void)initBanner{
    _bannerArray = [[NSMutableArray alloc]init];
    NSDictionary *bannerOne = @{@"image":@"icon_main_banner_one.png",@"url":@"http://baidu.com"};
    NSDictionary *bannerTwo = @{@"image":@"icon_main_banner_one.png",@"url":@"http://baidu.com"};
    [_bannerArray addObject:bannerOne];
    [_bannerArray addObject:bannerTwo];
    [_bannerView setContentSize:CGSizeMake(CURRENT_WIDTH*_bannerArray.count, 160)];
    
    for (int i = 0; i < _bannerArray.count; i++) {
        NSDictionary *dic = [_bannerArray objectAtIndex:i];
        UIImageView *iamgeView = [[UIImageView alloc]initWithFrame:CGRectMake(i*CURRENT_WIDTH, 0, CURRENT_WIDTH, 160)];
        NSString *imageName = [dic nonNullValueForKey:@"image"];
        [iamgeView setImage:[UIImage imageNamed:imageName]];
        [_bannerView addSubview:iamgeView];
    }
    
    
    
}
-(void)setDefaultValue{
    NSLog(@"%@",self.navigationController);
//    self.navigationItem.title = @"首页";
    [self.navigationController setTitle:@"首页"];
//    self.title = @"首页";

    [self.navigationController.navigationBar setBackgroundColor:[UIColor blueColor]];
    
    _tableItems = [[NSMutableArray alloc]init];
    NSDictionary *newsOne = @{@"image":@"image_main_news_one.png",@"url":@"http://baidu.com",@"title":@"新2015年驾校科目四安全常识",@"content":@"为了更好的培养出优秀的驾驶员，驾驶员考试越来越严格且项目增多。对于学员的驾驶技能又有很大的考验。特此考试吧为大家整理了相关内容，供大家参考学习！"};
    NSDictionary *newsTwo = @{@"image":@"image_main_news_one.png",@"url":@"http://baidu.com",@"title":@"教练想学员索要500元保险费被开除",@"content":@"佛山一名驾校教练为疏通关系,收取学员300元到500元不等的“保险费”后向考官行贿,共有14名交警牵涉其中,涉案金额达61.7万元。"};
    NSDictionary *newsThree = @{@"image":@"image_main_news_one.png",@"url":@"http://baidu.com",@"title":@"教练想学员索要500元保险费被开除",@"content":@"佛山一名驾校教练为疏通关系,收取学员300元到500元不等的“保险费”后向考官行贿,共有14名交警牵涉其中,涉案金额达61.7万元。"};
    NSDictionary *newsFour = @{@"image":@"image_main_news_one.png",@"url":@"http://baidu.com",@"title":@"教练想学员索要500元保险费被开除",@"content":@"佛山一名驾校教练为疏通关系,收取学员300元到500元不等的“保险费”后向考官行贿,共有14名交警牵涉其中,涉案金额达61.7万元。"};
    NSDictionary *newsFive = @{@"image":@"image_main_news_one.png",@"url":@"http://baidu.com",@"title":@"教练想学员索要500元保险费被开除",@"content":@"佛山一名驾校教练为疏通关系,收取学员300元到500元不等的“保险费”后向考官行贿,共有14名交警牵涉其中,涉案金额达61.7万元。"};
    NSDictionary *newsSix = @{@"image":@"image_main_news_one.png",@"url":@"http://baidu.com",@"title":@"教练想学员索要500元保险费被开除",@"content":@"佛山一名驾校教练为疏通关系,收取学员300元到500元不等的“保险费”后向考官行贿,共有14名交警牵涉其中,涉案金额达61.7万元。"};
    
    [_tableItems addObject:newsOne];
    [_tableItems addObject:newsTwo];
    [_tableItems addObject:newsThree];
    [_tableItems addObject:newsFour];
    [_tableItems addObject:newsFive];
    [_tableItems addObject:newsSix];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}
-(void)initFrame{
    if(iPhone6){
        _tableView.frame = CGRectMake(0,_tableView.frame.origin.y , CURRENT_WIDTH, _tableView.frame.size.height+40);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIndentifier = @"mainCell";
    NSDictionary *dic = [_tableItems objectAtIndex:indexPath.row];
    DSMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if(!cell){
        cell = [[DSMainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    cell.title.text = [dic nonNullValueForKey:@"title"];
    cell.content.text = [dic nonNullValueForKey:@"content"];
    NSString *imageName = [dic nonNullValueForKey:@"image"];
    [cell.image setImage:[UIImage imageNamed:imageName]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
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
