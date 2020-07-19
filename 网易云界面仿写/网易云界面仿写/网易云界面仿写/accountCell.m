//
//  accountCell.m
//  网易云界面仿写
//
//  Created by 张立远 on 2020/7/17.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "accountCell.h"

@implementation accountCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style
        reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        
        self.label2 = [[UILabel alloc] init];
        [self.contentView addSubview:_label2];
        
        self.icon1 = [[UIButton alloc] init];
        [self.contentView addSubview:_icon1];
    }
    return self;
}
- (void) layoutSubviews {
    [super layoutSubviews];
    
    _icon1.frame = CGRectMake(3, 7, 35, 35);
    
    _label1.frame = CGRectMake(55, 0, 150, 50);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
