//
//  ColumanarViewController.m
//  ColumnarChart
//
//  Created by 李茂轩 on 15/10/12.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ColumanarViewController.h"
#import "ChartColumnarView.h"
@interface ColumanarViewController ()
@property (nonatomic,retain)ChartColumnarView *chartColumnarView;
@end

@implementation ColumanarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.chartColumnarView = [[ChartColumnarView alloc]initWithFrame:CGRectMake(0, 100,self.view.frame.size.width  , self.view.frame.size.height-100)];
    
    [self.view addSubview:self.chartColumnarView];

    [self performSelector:@selector(start) withObject:nil afterDelay:1];
   
    // Do any additional setup after loading the view.
}

- (void)start{
  [self.chartColumnarView reloadChartData];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
