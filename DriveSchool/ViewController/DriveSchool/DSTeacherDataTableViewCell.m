//
//  DSTeacherDataTableViewCell.m
//  DriveSchool
//
//  Created by 张学成 on 15/2/20.
//  Copyright (c) 2015年 张学成. All rights reserved.
//

#import "DSTeacherDataTableViewCell.h"

@implementation DSTeacherDataTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.dataButton.frame = CGRectMake(CURRENT_WIDTH-self.dataButton.frame.size.width-20, self.dataButton.frame.origin.y, self.dataButton.frame.size.width, self.dataButton.frame.size.height);
    [self.dataButton setBorderWithRedius:5.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
