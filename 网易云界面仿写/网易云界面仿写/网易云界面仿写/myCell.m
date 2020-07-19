//
//  myCell.m
//  网易云界面仿写
//
//  Created by 张立远 on 2020/7/17.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "myCell.h"

@implementation myCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.icon1 = [[UIButton alloc] init];
        [self.contentView addSubview:_icon1];
        
        self.label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        
        self.label2 = [[UILabel alloc] init];
        [self.contentView addSubview:_label2];
    }
    return self;
}
- (void) layoutSubviews {
    _icon1.frame = CGRectMake(0, 0, 55, 50);
    
    _label1.frame = CGRectMake(15, 0, 200, 50);
    
    _label2.frame = CGRectMake(100, 0, 70, 50);
}

- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
