//
//  DSFindTeacherTableViewCell.h
//  DriveSchool
//
//  Created by 张学成 on 15/3/3.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSFindTeacherTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *recommendImage;
@property (weak, nonatomic) IBOutlet UILabel *studentNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *teachAgeLabel;

@end
