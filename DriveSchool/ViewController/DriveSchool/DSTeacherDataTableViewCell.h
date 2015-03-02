//
//  DSTeacherDataTableViewCell.h
//  DriveSchool
//
//  Created by 张学成 on 15/2/20.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSTeacherDataTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIButton *dataButton;

@end
