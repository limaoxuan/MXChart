//
//  ViewController.m
//  ColumnarChart
//
//  Created by 李茂轩 on 15/10/5.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ViewController.h"
#import "ChartColumnarView.h"
#import "MXMobileTools.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property (nonatomic,retain)ChartColumnarView *chartColumnarView;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,retain)NSMutableArray *itemArray;
@property (nonatomic,retain)NSMutableArray *classArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Sample";
    self.automaticallyAdjustsScrollViewInsets = NO;
 
    
    
    self.itemArray = [[NSMutableArray alloc]init];
    [self.itemArray addObject:@"Columanar 柱状图"];
    [self.itemArray addObject:@"Cicle 圆形"];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    self.classArray = [[NSMutableArray alloc]init];
    [self.classArray addObject:@"ColumanarViewController"];
    [self.classArray addObject:@"CircleViewController"];


    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CRVExamineApproveDetailTableViewCell";
    //首先根据标识去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果缓存池没有到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.itemArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [MXMobileTools pushFromViewController:self toViewControllerName:self.classArray[indexPath.row]];


    
    


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
