//
//  MyMusic.m
//  网易云界面仿写
//
//  Created by 张立远 on 2020/7/17.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "MyMusic.h"
#import "myCell.h"
#import "VCSecond.h"

@interface MyMusic ()

@end

@implementation MyMusic

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationItem.title = @"我的音乐";
    
    UIBarButtonItem* btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"云.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressNext)];
    
    self.navigationItem.leftBarButtonItem = btn;
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerClass:[myCell class] forCellReuseIdentifier:@"musicCell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //加小箭头
    //cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    [self.view addSubview:_tableView];
}

-(void)pressNext{
    VCSecond* vc = [[VCSecond alloc] init];

    [self.navigationController pushViewController:vc animated:YES];

}



/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    self.title = @"我的";
    UIBarButtonItem* btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"云.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressNext)];
    
    self.navigationItem.leftBarButtonItem = btn;

    
    
    UIView* view1 = [[UIView alloc] init];
    
    view1.backgroundColor = [UIColor whiteColor];
    view1.frame = CGRectMake(0, 0, 400, 600);
    
    [_tableView addSubview: view1];
    
    
    //_tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //自动调整子视图大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    
    //注册可以注释掉
    //[self.tableView registerClass:[myCell class] forCellReuseIdentifier:@"musicCell"];
    
    [self.view addSubview:_tableView];
    
    _arrayData = [[NSMutableArray alloc] init];
    
    NSArray* array00 = [NSArray arrayWithObjects:@"", nil];
    NSArray* array01 = [NSArray arrayWithObjects:@"下载列表", nil];
    NSArray* array02 = [NSArray arrayWithObjects:@"我的音乐", @"", nil];
    NSArray* array03 = [NSArray arrayWithObjects:@"最近播放", @"", nil];
    NSArray* array04 = [NSArray arrayWithObjects:@"创建歌单", @"", nil];
    
    [_arrayData addObject:array00];
    [_arrayData addObject:array01];
    [_arrayData addObject:array02];
    [_arrayData addObject:array03];
    [_arrayData addObject:array04];

}
*/


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1 && indexPath.row == 1){
        return 120;
    }if(indexPath.section == 1 && indexPath.row == 0){
        return 170;
    }
return 220;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [NSArray arrayWithObjects:@1, @3, nil];
    return [array[section] integerValue];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell1 = nil;
    UITableViewCell *cell2 = nil;
    UITableViewCell *cell3 = nil;
    UITableViewCell *cell4 = nil;
    cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
    cell4 = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
    
    if(indexPath.section == 0){
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setBackgroundImage:[UIImage imageNamed:@"下载.png"] forState:UIControlStateNormal];
        button1.frame = CGRectMake(35, 140, 30, 30);
            [cell1 addSubview:button1];
        UILabel* label1 = [[UILabel alloc] init];
        label1.text = @"本地音乐";
        label1.font = [UIFont systemFontOfSize:13];
        label1.frame = CGRectMake(-10, 35, 70, 30);
        [button1 addSubview:label1];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 setBackgroundImage:[UIImage imageNamed:@"耳机.png"] forState:UIControlStateNormal];
        button2.frame = CGRectMake(125, 140, 33, 33);
        [cell1 addSubview:button2];
        UILabel* label2 = [[UILabel alloc] init];
        label2.text = @"我的电台";
        label2.font = [UIFont systemFontOfSize:15];
        label2.frame = CGRectMake(-15, 35, 70, 30);
        [button2 addSubview:label2];
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button3 setBackgroundImage:[UIImage imageNamed:@"收藏.png"] forState:UIControlStateNormal];
        button3.frame = CGRectMake(213, 140, 30, 30);
        [cell1 addSubview:button3];
        UILabel* label3 = [[UILabel alloc] init];
        label3.text = @"我的收藏";
        label3.font = [UIFont systemFontOfSize:15];
        label3.frame = CGRectMake(-15, 35, 70, 30);
        [button3 addSubview:label3];
        
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button4 setBackgroundImage:[UIImage imageNamed:@"歌曲.png"] forState:UIControlStateNormal];
        button4.frame = CGRectMake(300, 140, 30, 30);
        [cell1 addSubview:button4];
        UILabel* label4 = [[UILabel alloc] init];
        label4.text = @"关注新歌";
        label4.font = [UIFont systemFontOfSize:15];
        label4.frame = CGRectMake(-15, 35, 70, 30);
        [button4 addSubview:label4];
        
        UIButton* button5 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button5 setBackgroundImage:[UIImage imageNamed:@"我的1.jpg"]
                           forState:UIControlStateNormal];
        button5.frame = CGRectMake(15, 20, 80, 80);
        [cell1 addSubview:button5];
        UILabel* label5 = [[UILabel alloc] init];
        label5.text = @"薰衣草紫";
        label5.font = [UIFont systemFontOfSize:20];
        label5.frame = CGRectMake(90, 10, 100, 30);
        [button5 addSubview:label5];
        
        /*
        [cell1.imageView setImage:[UIImage imageNamed:@"我的.jpg"]];
        cell1.imageView.frame = CGRectMake(10, -10, 30, 30);
        cell1.textLabel.text = @"薰衣草紫";
        cell1.textLabel.frame = CGRectMake(10, 10, 30, 40) ;
        [self.tableView addSubview:cell1.textLabel];
        [self.tableView addSubview:cell1.imageView];
*/
        
        return cell1;
    }else if(indexPath.section == 1 && indexPath.row == 0){
        cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell2"];
        
        UILabel* labelFirst = [[UILabel alloc] init];
        labelFirst = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 50)];
        labelFirst.text = @"我的音乐";
        labelFirst.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [cell2.contentView addSubview:labelFirst];
        
        UIButton *button11 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button11 setBackgroundImage:[UIImage imageNamed:@"c1.jpg"] forState:UIControlStateNormal];
        button11.frame = CGRectMake(17, 45, 90, 130);
                   [cell2 addSubview:button11];
        
        UIButton *button12 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button12 setBackgroundImage:[UIImage imageNamed:@"c2.jpg"] forState:UIControlStateNormal];
        button12.frame = CGRectMake(142, 43, 90, 130);
        [cell2 addSubview:button12];
        
        UIButton *button13 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button13 setBackgroundImage:[UIImage imageNamed:@"c3.jpg"] forState:UIControlStateNormal];
        button13.frame = CGRectMake(265, 43, 90, 130);
        [cell2 addSubview:button13];
        
        /*
        UIButton *button11 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button11 setBackgroundImage:[UIImage imageNamed:@"mojito.jpg"] forState:UIControlStateNormal];
        button11.frame = CGRectMake(17, 55, 90, 130);
                   [cell2 addSubview:button11];
        UILabel* label11 = [[UILabel alloc] init];
        label11.text = @"本地音乐";
        //label11.font = [UIFont systemFontOfSize:15];
        label11.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];//加粗

        label11.frame = CGRectMake(16, 127, 70, 30);
        [button11 addSubview:label11];
       
       // UIButton* word1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
       // word1.frame = CGRectMake(37, 170, 70, 30);
        //word1.backgroundColor = [UIColor grayColor];
        //[word1 setTitle:@"本地音乐" forState:UIControlStateHighlighted];
       // [word1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
       // [cell2 addSubview:word1];
       
        
        
        UIButton *button12 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button12 setBackgroundImage:[UIImage imageNamed:@"磁盘.jpg"] forState:UIControlStateNormal];
        button12.frame = CGRectMake(142, 55, 90, 130);
        [cell2 addSubview:button12];
        UILabel* label12 = [[UILabel alloc] init];
        label12.text = @"你的私人曲库";
        label12.textColor = [UIColor blackColor];
        //label12.font = [UIFont systemFontOfSize:13];
        label12.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];//加粗
        label12.frame = CGRectMake(5, 127, 100, 30);
        [button12 addSubview:label12];
        
        UIButton *button13 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button13 setBackgroundImage:[UIImage imageNamed:@"亚索.jpg"] forState:UIControlStateNormal];
        button13.frame = CGRectMake(265, 55, 90, 130);
        [cell2 addSubview:button13];
        UILabel* label13 = [[UILabel alloc] init];
        label13.text = @"用户推荐精选";
        label13.textColor = [UIColor blackColor];
        //label12.font = [UIFont systemFontOfSize:13];
        label13.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];//加粗
        label13.frame = CGRectMake(5, 127, 100, 30);
        [button13 addSubview:label13];
        */
        
        return cell2;
    }else if(indexPath.section == 1 && indexPath.row == 1){
        
          cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell3"];
        
        UILabel* labelScond = [[UILabel alloc] init];
        labelScond = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 50)];
        labelScond.text = @"最近播放";
        labelScond.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [cell3.contentView addSubview:labelScond];
        
        UIButton *button21 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button21 setBackgroundImage:[UIImage imageNamed:@"风景.jpg"] forState:UIControlStateNormal];
        button21.frame = CGRectMake(20, 55, 65, 65);
        [cell3 addSubview:button21];
        UILabel* label21 = [[UILabel alloc] init];
        label21.text = @"全部已播歌曲";
        label21.textColor = [UIColor blackColor];
        label21.font = [UIFont systemFontOfSize:13];
        label21.frame = CGRectMake(75, 4, 100, 30);
        [button21 addSubview:label21];
        
        UILabel* labelSecond = [[UILabel alloc] init];
        labelSecond.text = @"300首";
        labelSecond.textColor = [UIColor grayColor];
        labelSecond.font = [UIFont systemFontOfSize:13];
        labelSecond.frame = CGRectMake(75, 23, 40, 30);
        [button21 addSubview:labelSecond];
        
        
        
        UIButton *button22 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button22 setBackgroundImage:[UIImage imageNamed:@"恋爱.jpg"] forState:UIControlStateNormal];
        button22.frame = CGRectMake(190, 55, 65, 65);
        [cell3 addSubview:button22];
        UILabel* label22 = [[UILabel alloc] init];
        label22.text = @"歌单: 翻唱";
        label22.textColor = [UIColor blackColor];
        label22.font = [UIFont systemFontOfSize:13];
        label22.frame = CGRectMake(75, 4, 100, 30);
        [button22 addSubview:label22];
        
        UILabel* labelthird = [[UILabel alloc] init];
        labelthird.text = @"继续播放";
        labelthird.textColor = [UIColor grayColor];
        labelthird.font = [UIFont systemFontOfSize:13];
        labelthird.frame = CGRectMake(75, 23, 70, 30);
        [button22 addSubview:labelthird];
        
         return cell3;
    }else if(indexPath.section == 1 && indexPath.row == 2){
        
         cell4 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell4"];
        UILabel* labelThird = [[UILabel alloc] init];
        labelThird = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 50)];
        labelThird.text = @"创建歌单";
        labelThird.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [cell4.contentView addSubview:labelThird];
        
        UILabel* labelFourth = [[UILabel alloc] init];
        labelFourth = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 300, 50)];
        labelFourth.text = @" 收藏歌单   歌单助手              +  >";
        labelFourth.textColor = [UIColor grayColor];
        labelFourth.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [cell4.contentView addSubview:labelFourth];
        
        
        UIButton *button31 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button31 setBackgroundImage:[UIImage imageNamed:@"风景2.jpg"] forState:UIControlStateNormal];
        button31.frame = CGRectMake(20, 55, 65, 65);
        [cell4 addSubview:button31];
        UILabel* label31 = [[UILabel alloc] init];
        label31.text = @"翻唱";
        label31.textColor = [UIColor blackColor];
        label31.font = [UIFont systemFontOfSize:15];
        label31.frame = CGRectMake(75, 4, 100, 30);
        [button31 addSubview:label31];
        
        UILabel* labelthird = [[UILabel alloc] init];
        labelthird.text = @"13首";
        labelthird.textColor = [UIColor grayColor];
        labelthird.font = [UIFont systemFontOfSize:13];
        labelthird.frame = CGRectMake(75, 23, 70, 30);
        [button31 addSubview:labelthird];
        
        
        UIButton *button32 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button32 setBackgroundImage:[UIImage imageNamed:@"风景1.jpg"] forState:UIControlStateNormal];
        button32.frame = CGRectMake(190, 55, 65, 65);
        [cell4 addSubview:button32];
        UILabel* label32 = [[UILabel alloc] init];
        label32.text = @"跑步";
        label32.textColor = [UIColor blackColor];
        label32.font = [UIFont systemFontOfSize:15];
        label32.frame = CGRectMake(75, 4, 100, 30);
        [button32 addSubview:label32];
        
        UILabel* labelfourth = [[UILabel alloc] init];
        labelfourth.text = @"6首";
        labelfourth.textColor = [UIColor grayColor];
        labelfourth.font = [UIFont systemFontOfSize:13];
        labelfourth.frame = CGRectMake(75, 23, 70, 30);
        [button32 addSubview:labelfourth];
        
        
        UIButton *button33 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button33 setBackgroundImage:[UIImage imageNamed:@"紫色.jpg"] forState:UIControlStateNormal];
        button33.frame = CGRectMake(20, 150, 65, 65);
        [cell4 addSubview:button33];
        UILabel* label33 = [[UILabel alloc] init];
        label33.text = @"翻唱";
        label33.textColor = [UIColor blackColor];
        label33.font = [UIFont systemFontOfSize:15];
        label33.frame = CGRectMake(75, 4, 100, 30);
        [button33 addSubview:label33];
        
        UILabel* labelfifth = [[UILabel alloc] init];
        labelfifth.text = @"48首";
        labelfifth.textColor = [UIColor grayColor];
        labelfifth.font = [UIFont systemFontOfSize:13];
        labelfifth.frame = CGRectMake(75, 23, 70, 30);
        [button33 addSubview:labelfifth];
        
        UIButton *button34 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button34 setBackgroundImage:[UIImage imageNamed:@"文本.png"] forState:UIControlStateNormal];
        button34.frame = CGRectMake(190, 150, 40, 40);
        [cell4 addSubview:button34];
        UILabel* label34 = [[UILabel alloc] init];
        label34.text = @"翻唱";
        label34.textColor = [UIColor blackColor];
        label34.font = [UIFont systemFontOfSize:15];
        label34.frame = CGRectMake(75, 4, 100, 30);
        [button34 addSubview:label34];
        
        
        return cell4;
    }else{
        
        myCell* cell = nil;

        cell = [tableView dequeueReusableCellWithIdentifier:@"musicCell"forIndexPath:indexPath];
        
        NSArray *array01 = [NSArray arrayWithObjects:@"", nil];
        
        NSArray *array02 = [NSArray arrayWithObjects:@"我的音乐",@"最近播放", @"创建歌单 ", nil];
        
        NSArray *arraynum = [NSArray arrayWithObjects:array01, array02, nil];
        
        cell.label1.text = arraynum[indexPath.section][indexPath.row];

        return cell;
    }

}


//获取头部高度
/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
 */
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



- (UIView *) tableView:(UITableView *)tableView viewForRooterInSection:(NSInteger)section {
    return nil;
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
