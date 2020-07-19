//
//  MyAccount.m
//  网易云界面仿写
//
//  Created by 张立远 on 2020/7/17.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "MyAccount.h"
#import "accountCell.h"

@interface MyAccount ()


//@property (nonatomic, strong)UITableView *tableView;
//
//@property (nonatomic, copy)NSArray *array;

@end

@implementation MyAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航栏
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;

    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"音乐.png"] style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"二维码.png"] style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[accountCell class]  forCellReuseIdentifier:@"labelCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //去黑线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];


    
    
//    //创建数据视图对象
//    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 320, 536) style:UITableViewStyleGrouped];
//    //设置代理对象
//    _tableView.delegate = self;
//    //设置数据代理对象
//    _tableView.dataSource = self;
//
//    //数据视图显示
//    [self.view addSubview:_tableView];

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 180;
    } if (indexPath.section == 5) {
        return 60;
    }if(indexPath.section == 1){
        return 60;
    }if((indexPath.section == 2 && indexPath.row == 3) || (indexPath.section == 4 && indexPath.row == 1)){
        return 60;
    }
    return 50;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [NSArray arrayWithObjects:@1, @1, @4, @8, @4, @1 ,nil];
    return [array[section] integerValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //有几组数据就是几
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell1 = nil;
    UITableViewCell *cell2 = nil;
    UITableViewCell *cell3 = nil;
    UITableViewCell *cell4 = nil;
    UITableViewCell *cell5 = nil;

    cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
    cell4 = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
    cell5 = [tableView dequeueReusableCellWithIdentifier:@"cell5"];


    if (indexPath.section == 0) {
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor whiteColor];
            button.layer.masksToBounds = YES;
            button.layer.borderWidth = 1;
            button.layer.borderColor = [UIColor grayColor].CGColor;
            button.frame = CGRectMake(300, 20, 50, 35);
            //button.layer.cornerRadius = 5;
            button.tintColor = [UIColor whiteColor];
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [button setTitle:@"✅" forState:UIControlStateSelected];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"签到.png"]forState:UIControlStateNormal];
            
            
            [button addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];            [cell1.contentView addSubview:button];

        }
        
        //四个按钮
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setBackgroundImage:[UIImage imageNamed:@"信封 (2).png"] forState:UIControlStateNormal];
        button1.frame = CGRectMake(28, 113, 35, 30);
        [cell1 addSubview:button1];
        UILabel* label1 = [[UILabel alloc] init];
        label1.text = @"我的消息";
        label1.font = [UIFont systemFontOfSize:14];
        label1.frame = CGRectMake(-10, 32, 70, 30);
        [button1 addSubview:label1];


        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 setBackgroundImage:[UIImage imageNamed:@"好友.png"] forState:UIControlStateNormal];
        button2.frame = CGRectMake(120, 110, 30, 30);
        [cell1 addSubview:button2];
        UILabel* label2 = [[UILabel alloc] init];
        label2.text = @"我的好友";
        label2.font = [UIFont systemFontOfSize:14];
        label2.frame = CGRectMake(-10, 35, 70, 30);
        [button2 addSubview:label2];
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button3 setBackgroundImage:[UIImage imageNamed:@"主页.png"] forState:UIControlStateNormal];
        button3.frame = CGRectMake(220, 110, 30, 30);
        [cell1 addSubview:button3];
        UILabel* label3 = [[UILabel alloc] init];
        label3.text = @"个人主页";
        label3.font = [UIFont systemFontOfSize:14];
        label3.frame = CGRectMake(-15, 35, 70, 30);
        [button3 addSubview:label3];
        
        
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button4 setBackgroundImage:[UIImage imageNamed:@"衣服.png"] forState:UIControlStateNormal];
        button4.frame = CGRectMake(310, 110, 35, 35);
        [cell1 addSubview:button4];
        UILabel* label4 = [[UILabel alloc] init];
        label4.text = @"个人装扮";
        label4.font = [UIFont systemFontOfSize:14];
        label4.frame = CGRectMake(-10, 35, 70, 30);
        [button4 addSubview:label4];
        
        
        /*
        [cell1.imageView setImage:[UIImage imageNamed:@"我的.jpg"]];
        cell1.imageView.frame = CGRectMake(10, 10, 30, 30);
        cell1.textLabel.text = @"薰衣草紫";
        cell1.textLabel.frame = CGRectMake(10, 10, 30, 40) ;
        [self.tableView addSubview:cell1.textLabel];
        [self.tableView addSubview:cell1.imageView];
         */
        UIButton* button5 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button5 setBackgroundImage:[UIImage imageNamed:@"我的1.jpg"]
                           forState:UIControlStateNormal];
        button5.frame = CGRectMake(10, 15, 60, 60);
        [cell1 addSubview:button5];
        UILabel* label5 = [[UILabel alloc] init];
        label5.text = @"薰衣草紫";
        label5.font = [UIFont systemFontOfSize:17];
        label5.frame = CGRectMake(90, 10, 100, 30);
        [button5 addSubview:label5];
        
        return cell1;
    }else if (indexPath.section == 2 && indexPath.row == 1) {
        if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            UIButton *icon1 = [[UIButton alloc] initWithFrame: CGRectMake(3, 7, 35, 35)];
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 150, 50)];
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(230, 12, 200, 25)];
            
            [icon1 setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
            
            label1.text= @"商城";
            
            label2.font = [UIFont systemFontOfSize:15];
            
            [cell2.contentView addSubview:label1];
            [cell2.contentView addSubview:label2];
            [cell2.contentView addSubview:icon1];
            
            }

        cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell2;
            
    } else if (indexPath.section == 3 && indexPath.row == 2) {
        if (cell3 == nil) {
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
            UIButton *icon1 = [[UIButton alloc] initWithFrame: CGRectMake(3, 7, 35, 35)];
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 150, 50)];
            
            [icon1 setImage:[UIImage imageNamed:@"定时关闭.png"] forState:UIControlStateNormal];
            
            label1.text = @"定时关闭";
            
            [cell3.contentView addSubview:label1];
            [cell3.contentView addSubview:icon1];
        }
        //cell2.textLabel.text = @"123";
        cell3.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell3;
    } else if (indexPath.section == 3 && indexPath.row == 3) {
        if (cell4 == nil) {
            cell4 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4"];
            UIButton *icon1 = [[UIButton alloc] initWithFrame: CGRectMake(3, 7, 35, 35)];
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 150, 50)];
            
            [icon1 setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
            
            label1.text = @"夜间模式";
            //这里要添加一个事件
            
            UISwitch *switch1 = [[UISwitch alloc] initWithFrame:CGRectMake(290, 10, 40, 40)];
            
            [cell4.contentView addSubview:label1];
            [cell4.contentView addSubview:switch1];
            [cell4.contentView addSubview:icon1];
            
        }
        cell4.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell4;
    } else if (indexPath.section == 5) {
        if (cell5 == nil) {
            
            cell5 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell5"];
            
            UIButton *icon1 = [[UIButton alloc] initWithFrame:CGRectMake(113, 10, 100, 45)];
            
            [icon1 addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
            
            
            
            [icon1 setTitle:@"退出登录" forState:UIControlStateNormal];
            
            [icon1 setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
        
            [cell5.contentView addSubview:icon1];
        }

        return cell5;
    } else {
        accountCell* cell = nil;
        
        NSArray* first = [NSArray arrayWithObject:@"创作者中心"];
         
         NSArray* second = [NSArray arrayWithObjects:@"演出", @"商城", @"口袋彩铃",@"在线听歌免流量", nil];
         NSArray* third = [NSArray arrayWithObjects:@"设置",@"音乐黑名单", @"定时关闭", @"夜间模式", @"鲸云音效", @"添加Siri音效", @"音乐闹钟", @"青少年模式", nil];
         NSArray* forth = [NSArray arrayWithObjects:@"我的订单", @"优惠券", @"分享网易云音乐", @"关于", nil];
         NSArray* account = [[NSArray alloc] initWithObjects:first, second, third, forth, nil];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"labelCell" forIndexPath:indexPath];
        
        cell.label1.text = [[account objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
      
        NSArray *First1 = [NSArray arrayWithObject:[UIImage imageNamed:@"灯泡.png"]];
        
        NSArray *Second1 = [NSArray arrayWithObjects: [UIImage imageNamed:@"门票.png"], [UIImage imageNamed:@"4.png"], [UIImage imageNamed:@"彩铃.png"],[UIImage imageNamed:@"耳机.png"], nil];
        
        NSArray *Third1 = [NSArray arrayWithObjects:[UIImage imageNamed:@"6.png"], [UIImage imageNamed:@"黑名单.png"], [UIImage imageNamed:@"8.png"], [UIImage imageNamed:@"7.png"], [UIImage imageNamed:@"音效.png"], [UIImage imageNamed:@"苹果.png"], [UIImage imageNamed:@"12.png"], [UIImage imageNamed:@"青少年.png"], nil];
        
        NSArray *Forth1 = [NSArray arrayWithObjects:[UIImage imageNamed:@"14.png"], [UIImage imageNamed:@"15.png"],[UIImage imageNamed:@"16.png"],[UIImage imageNamed:@"17.png"], nil];
        
        NSArray *imAccount = [[NSArray alloc] initWithObjects:First1, Second1, Third1, Forth1, nil];
        
        [cell.icon1 setImage:imAccount[indexPath.section - 1][indexPath.row] forState:UIControlStateNormal];
        
        //设置小箭头风格
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
}

//签到函数
-(void)touchBtn:(UIButton*)button
{
    button.selected = !button.selected;
    if(button.selected){
        [button setImage:nil forState:UIControlStateNormal];
    }else{
        [button setImage:[UIImage imageNamed:@"金币.png"] forState:UIControlStateNormal];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRooterInSection:(NSInteger)section
{
    return 5;
}



//头部和尾部取消灰条条
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(CGFloat) tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}


-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(CGFloat) tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
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
