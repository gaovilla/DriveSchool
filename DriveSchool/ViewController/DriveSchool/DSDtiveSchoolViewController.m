//
//  DSDtiveSchoolViewController.m
//  DriveSchool
//
//  Created by 张学成 on 15/2/9.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSDtiveSchoolViewController.h"
#import "DSSubjectTwoCollectionViewCell.h"
#import "DSTeacherDateViewController.h"
@interface DSDtiveSchoolViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *moveView;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UIView *subjectOneView;
@property (weak, nonatomic) IBOutlet UIScrollView *subjectOneScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *subjectTwoView;

@property (strong, nonatomic) NSMutableArray *teacherArray;

@end

@implementation DSDtiveSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDefaultValue];
    [self setFrame];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.title = @"驾校";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setDefaultValue{
    
    [_subjectOneScrollView setContentSize:CGSizeMake(0, 800)];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;

    
    //设置教练信息
    NSDictionary *teacherOne = @{@"name":@"王艳伟",@"teachAge":@"5",@"studentNum":@"10",@"photo":@"icon_driveSchool_teacherOne.jpg"};
    NSDictionary *teacherTwo = @{@"name":@"佳腾",@"teachAge":@"8",@"studentNum":@"16",@"photo":@"icon_driveSchool_teacherTwo.jpg"};
    NSDictionary *teacherThree = @{@"name":@"吴悠恒",@"teachAge":@"3",@"studentNum":@"12",@"photo":@"icon_driveSchool_teacherThree.jpg"};
    NSDictionary *teacherFour = @{@"name":@"高越博",@"teachAge":@"5",@"studentNum":@"12",@"photo":@"icon_driveSchool_teacherFour.jpg"};
    NSDictionary *teacherFive = @{@"name":@"宋杰心",@"teachAge":@"5",@"studentNum":@"13",@"photo":@"icon_driveSchool_teacherFive.jpg"};
    NSDictionary *teacherSix = @{@"name":@"张伟",@"teachAge":@"5",@"studentNum":@"18",@"photo":@"icon_driveSchool_teacherSix.jpg"};
    NSDictionary *teacherSenve = @{@"name":@"刘磊",@"teachAge":@"5",@"studentNum":@"9",@"photo":@"icon_driveSchool_teacherSeven.jpg"};
    NSDictionary *teacherEight = @{@"name":@"王茹",@"teachAge":@"5",@"studentNum":@"11",@"photo":@"icon_driveSchool_teacherEight.jpg"};
    NSDictionary *teacherNine = @{@"name":@"张明",@"teachAge":@"5",@"studentNum":@"12",@"photo":@"icon_driveSchool_teacherNine.jpg"};
    _teacherArray = [[NSMutableArray alloc]init];
    [_teacherArray addObject:teacherOne];
    [_teacherArray addObject:teacherTwo];
    [_teacherArray addObject:teacherThree];
    [_teacherArray addObject:teacherFour];
    [_teacherArray addObject:teacherFive];
    [_teacherArray addObject:teacherSix];
    [_teacherArray addObject:teacherSenve];
    [_teacherArray addObject:teacherEight];
    [_teacherArray addObject:teacherNine];
}
-(void)setFrame{
    _subjectOneView.frame = CGRectMake(CURRENT_WIDTH, 120, CURRENT_WIDTH,_subjectOneView.frame.size.height);
    _collectionView.frame = CGRectMake(_collectionView.frame.origin.x, _collectionView.frame.origin.y, CURRENT_WIDTH,_collectionView.frame.size.height);
    _subjectTwoView.frame = CGRectMake(CURRENT_WIDTH*2, _subjectTwoView.frame.origin.y, CURRENT_WIDTH,_subjectTwoView.frame.size.height);
}
- (IBAction)tapLabelOne:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _moveView.frame = CGRectMake(0, 112-70, CURRENT_WIDTH/3, 5);
        _subjectOneScrollView.frame = CGRectMake(0, 120, CURRENT_WIDTH, _subjectOneScrollView.frame.size.height);
        _subjectOneView.frame = CGRectMake(CURRENT_WIDTH, 120, CURRENT_WIDTH,_subjectOneView.frame.size.height);
        _subjectTwoView.frame = CGRectMake(CURRENT_WIDTH*2, _subjectTwoView.frame.origin.y, CURRENT_WIDTH,_subjectTwoView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
}
- (IBAction)tapLabelTwo:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _moveView.frame = CGRectMake(CURRENT_WIDTH/3, 112-70, CURRENT_WIDTH/3, 5);
        
        _subjectOneScrollView.frame = CGRectMake(-CURRENT_WIDTH, 120, CURRENT_WIDTH, _subjectOneScrollView.frame.size.height);
        _subjectOneView.frame = CGRectMake(0, 120, CURRENT_WIDTH,_subjectOneView.frame.size.height);
        _subjectTwoView.frame = CGRectMake(CURRENT_WIDTH, _subjectTwoView.frame.origin.y, CURRENT_WIDTH,_subjectTwoView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
}
- (IBAction)tapLabelThree:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _moveView.frame = CGRectMake(CURRENT_WIDTH/3*2, 112-70, CURRENT_WIDTH/3, 5);
        
        _subjectOneScrollView.frame = CGRectMake(-CURRENT_WIDTH*2, 120, CURRENT_WIDTH, _subjectOneScrollView.frame.size.height);
        _subjectOneView.frame = CGRectMake(-CURRENT_WIDTH, 120, CURRENT_WIDTH,_subjectOneView.frame.size.height);
        
        _subjectTwoView.frame = CGRectMake(0, _subjectTwoView.frame.origin.y, CURRENT_WIDTH,_subjectTwoView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"GradientCell";
    DSSubjectTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *teacherInfo = [_teacherArray objectAtIndex:indexPath.row];
    
    cell.name.text = [teacherInfo objectForKey:@"name"];
    
    cell.teachAge.text = [[NSString alloc]initWithFormat:@"%@年",[teacherInfo objectForKey:@"teachAge"]];
    cell.studentNum.text = [[NSString alloc]initWithFormat:@"%@人",[teacherInfo objectForKey:@"studentNum"]];
    [cell.imageView setImage:[UIImage imageNamed:[teacherInfo objectForKey:@"photo"]]];

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [self getViewControllerFromStoryBoard:@"DSTeacherDateViewController"];
    NSDictionary *teacherInfo = [_teacherArray objectAtIndex:indexPath.row];
    [vc.passedParams setObject:teacherInfo forKey:@"teacherInfo"];
    [self.navigationController pushViewController:vc animated:YES];
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
