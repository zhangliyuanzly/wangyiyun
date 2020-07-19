//
//  VCSecond.m
//  网易云界面仿写
//
//  Created by 张立远 on 2020/7/18.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIScrollView* sv = [[UIScrollView alloc] init];
    sv.pagingEnabled = YES;

    sv.frame = CGRectMake(0, 0, 400, 576);
    sv.contentSize = CGSizeMake(400 * 5, 576);
    sv.alwaysBounceVertical = NO;
    sv.alwaysBounceHorizontal = NO;

    sv.backgroundColor = [UIColor redColor];
    
    for(int i = 0; i < 5; i++){
        NSString* strName = [NSString stringWithFormat:@"a%d.jpg", i+1 ];
        
        UIImage* image = [UIImage imageNamed:strName];
        
        UIImageView* iView = [[UIImageView alloc] initWithImage:image];
        
        iView.frame = CGRectMake(400 * i, 0, 400 , 576);
        
        [sv addSubview:iView];
        
        
    }
    
    
    [self.view addSubview:sv];

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
