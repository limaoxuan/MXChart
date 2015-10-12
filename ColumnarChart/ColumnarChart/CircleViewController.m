//
//  CircleViewController.m
//  ColumnarChart
//
//  Created by 李茂轩 on 15/10/12.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "CircleViewController.h"
#define RGBA(r,g,b,a)               [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#import "ChartCicleView.h"
@interface CircleViewController ()
@property (nonatomic,retain)ChartCicleView *chartView;
@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *startArray = [@[[self returnStrWithFloat:M_PI*1.05],[self returnStrWithFloat:M_PI*0.51],[self returnStrWithFloat:M_PI*0.05]]mutableCopy];
    NSMutableArray *endArray = [@[[self returnStrWithFloat:M_PI*1.99],[self returnStrWithFloat:M_PI*0.99],[self returnStrWithFloat:M_PI*0.49]]mutableCopy];
    NSMutableArray *colorArray = [@[RGBA(157, 229, 243, 1), RGBA(250, 107, 103, 1),RGBA(254, 225, 133, 1)]mutableCopy];
    
    
    UIView *currentView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200)];
    [self.view addSubview:currentView];
    
    
    
    self.chartView = [[ChartCicleView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 250) withLineWidth:30 withItemsCount:3 withStartAngleArray:startArray withEndAngleArray:endArray withBackGroundArray:colorArray];
    
    
    [currentView addSubview:self.chartView];
    
    [self.chartView reloadRatio];

    // Do any additional setup after loading the view.
}

- (NSString *)returnStrWithFloat:(CGFloat )floatValue{
    
    
    
    return [NSString stringWithFormat:@"%f",floatValue];
    
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
