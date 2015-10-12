//
//  ChartColumnarView.m
//  ColumnarChart
//
//  Created by 李茂轩 on 15/10/5.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ChartColumnarView.h"

//#define labelmarginX
//#define

#define orgainX 0
#define labelHeightX 40
#define labelWidthY 40

// 开始点与原点距离
#define startMargin 40
// label和line 的间距
#define labelMarginLine 2

@interface ChartColumnarView()

@property (nonatomic,retain)NSMutableArray *xPoint;
@property (nonatomic,retain)NSMutableDictionary *yPoint;



@end


@implementation ChartColumnarView





- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.xPoint = [[NSMutableArray alloc]init];
         self.yPoint = [[NSMutableDictionary alloc]init];
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    // // 数据源
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6"];

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawXLine:context WithFrame:rect];
    [self drawYLine:context WithFrame:rect];
    [self drawXline:context WithFrame:rect WithAccroidngYDataSource:array];
    
//    [self reloadChartData];
//    [self reloadChartDataWithContext:context];
    
}

- (void)drawXLine:(CGContextRef)context WithFrame:(CGRect)rect{
    
    
    
    // 数据源
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6"];

    
    
    // 每个label的宽度
    CGFloat labelWidth = ([UIScreen mainScreen].bounds.size.width - startMargin) / array.count;

    
    
//    int labelMarginLine = 2;
    
    // 线的y轴坐标 2
    int orgainY = rect.size.height- labelHeightX - labelMarginLine;
    
    
    // 画笔移动到当前点
    CGContextMoveToPoint(context, orgainX+startMargin, orgainY);

    
    
    // label与line  x轴 的开始点
    int x = orgainX+startMargin;
    
    // label y的轴的开始点
    int y = rect.size.height-labelHeightX;
    for (int index = 0; index < array.count; index++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x, y, labelWidth, labelHeightX)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%@月",array[index]];
        [self addSubview:label];
        
        
        NSValue *valueX = [NSValue valueWithCGPoint:CGPointMake(x+ labelWidth/2.0 , orgainY)];
        [self.xPoint addObject:valueX];
        
        
        x += labelWidth;
        
        
       
        
        CGContextAddLineToPoint(context, x, orgainY);
        
        
        
    }
    [[UIColor blackColor] set];
    //设置线段宽度
    CGContextSetLineWidth(context, 1);
    //设置颜色


    CGContextStrokePath(context);
}


//- (void)

- (void)drawYLine:(CGContextRef)context WithFrame:(CGRect)rect{

    NSArray *array = @[@"6",@"5",@"4",@"3",@"2",@"1"];
    
    CGFloat labelHeight = (rect.size.height - labelHeightX - labelMarginLine)/array.count;
    
     int orgainY = 0;
    
    
    
    
    
    CGContextMoveToPoint(context, orgainX + startMargin, orgainY);
    
    int x = orgainX + startMargin;
    int y = 4;
    
    
    
    for (int index = 0; index < array.count; index++) {
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x- startMargin, y-labelHeight/2.0, labelWidthY, labelHeight)];
        label.textAlignment = NSTextAlignmentCenter;
//        label.backgroundColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"%@天",array[index]];
        [self addSubview:label];
        


        y += labelHeight;
        
        
        CGContextAddLineToPoint(context, x, y);
        
        [self addSubview:label];
        
        
    }
    [[UIColor blackColor] set];


    CGContextStrokePath(context);



}

- (void)drawXline:(CGContextRef)context WithFrame:(CGRect)rect WithAccroidngYDataSource:(NSArray *)array{

   
    
    
    CGFloat labelHeight = (rect.size.height - labelHeightX - labelMarginLine)/array.count;
    
    int currentX = orgainX + startMargin;
    int currentY = 0;
    
    int y = currentY+1;
   
    int x = rect.size.width -5;
    


    
    for (int index = 0; index < array.count; index++) {
        
        
        
        CGContextMoveToPoint(context, currentX, y);
        
        CGContextAddLineToPoint(context, x, y);
        
        CGContextStrokePath(context);

//        [self.yPoint addObject:[NSString stringWithFormat:@"%d",y]];
        
        
        [self.yPoint setObject:[NSString stringWithFormat:@"%d",y] forKey:[NSString stringWithFormat:@"%lu",array.count-index]];
        
        
        
        y +=labelHeight;
        
        
        
    }
    
    
    




}





- (void)reloadChartData{



    
    
    NSArray *dataArray = @[@"1",@"3",@"4",@"5",@"6",@"2"];
    

   
    
    for (int index = 0; index < dataArray.count; index++) {
        
        
        NSValue *value = self.xPoint[index];
        CGPoint point = [value CGPointValue];
        
        
      
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:point];
        
        
        
//        CGContextMoveToPoint(context, point.x, point.y);
        
        
        
        
        
        int y = [self getYPointWithIntStr:dataArray[index]];
        
        NSLog(@"%d",y);
        
        CGPoint newPoint = CGPointMake(point.x, y);
        
        [path addLineToPoint:newPoint];
        
       
        /**创建带形状的图层*/
        CAShapeLayer *_shapeLayer=[CAShapeLayer layer];
//        frame.size.height);
        _shapeLayer.frame=CGRectMake(0, 0, 100, 100);
//        _shapeLayer.position=self.center;
        _shapeLayer.path=path.CGPath;
        _shapeLayer.strokeColor = [UIColor colorWithRed:241/255.0 green:95/255.0 blue:95/255.0 alpha:1].CGColor;
//        _shapeLayer.fillColor = [UIColor colorWithRed:241/255.0 green:95/255.0 blue:95/255.0 alpha:1].CGColor;
        _shapeLayer.lineWidth = 20;
        
        [self.layer addSublayer:_shapeLayer];
        [self animateChart:_shapeLayer];
        
        
    }
    
    

}

- (void)animateChart:(CAShapeLayer *)pathLayer{
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.delegate = self;
    pathAnimation.fromValue = @0.0;
    pathAnimation.toValue = @1.0;

    [pathLayer addAnimation:pathAnimation forKey:@"Point"];
    
    
}

- (void)startAnimation{








}

- (int)getYPointWithIntStr:(NSString *)str{


//    int x = [str integerValue];
    
    
    NSLog(@"%@",[self.yPoint allKeys]);
    
    
    int y = [[self.yPoint objectForKey:str] integerValue];
    

    return y;
}
@end
