//
//  ChartCicleView.h
//  HRWJ
//
//  Created by 李茂轩 on 15/9/24.
//  Copyright (c) 2015年 HRWJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartCicleView : UIView

@property (nonatomic,assign)NSInteger itemsCount;
@property (nonatomic,assign)CGFloat lineWidth;
@property (nonatomic,retain)NSMutableArray *startAngleArray;
@property (nonatomic,retain)NSMutableArray *endAngleArray;
@property (nonatomic,retain)NSMutableArray *backGroundArray;
- (void)reloadRatio;
-(id)initWithFrame:(CGRect)frame withLineWidth:(CGFloat)lineWidth withItemsCount:(NSInteger)number withStartAngleArray:(NSMutableArray *)startAngleArray withEndAngleArray:(NSMutableArray *)endAngleArray  withBackGroundArray:(NSMutableArray *)backGroundArray;
@end
