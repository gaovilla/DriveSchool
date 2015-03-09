//
//  DSFindSchoolViewController.m
//  DriveSchool
//
//  Created by 张学成 on 15/3/4.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSFindSchoolViewController.h"
#import "DSFindSchoolTableViewCell.h"

@interface DSFindSchoolViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *schoolArray;

@end

@implementation DSFindSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _schoolArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"schoolCell";
    DSFindSchoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell = [[DSFindSchoolTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *teacherInfo = [_schoolArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [teacherInfo objectForKey:@"name"];
    cell.studentNumLabel.text = [[NSString alloc]initWithFormat:@"%@人",[teacherInfo objectForKey:@"studentNum"]];
    cell.addressLabel.text = [[NSString alloc]initWithFormat:@"%@，",[teacherInfo objectForKey:@"sex"]];
    
    [cell.photoImage setImage:[UIImage imageNamed:[teacherInfo objectForKey:@"photo"]]];
    cell.moneyLabel.text =[[NSString alloc]initWithFormat:@"￥%@",[teacherInfo objectForKey:@"money"]];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
