//
//  ChartCicleView.m
//  HRWJ
//
//  Created by 李茂轩 on 15/9/24.
//  Copyright (c) 2015年 HRWJ. All rights reserved.
//

#import "ChartCicleView.h"
#define RGBA(r,g,b,a)               [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
@implementation ChartCicleView

-(id)initWithFrame:(CGRect)frame withLineWidth:(CGFloat)lineWidth withItemsCount:(NSInteger)number withStartAngleArray:(NSMutableArray *)startAngleArray withEndAngleArray:(NSMutableArray *)endAngleArray  withBackGroundArray:(NSMutableArray *)backGroundArray
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        //initialization
        self.backgroundColor = [UIColor whiteColor];
        self.lineWidth = lineWidth;
        self.itemsCount = number;
        self.startAngleArray = startAngleArray;
        self.endAngleArray = endAngleArray;
        self.backGroundArray = backGroundArray;
        
        
//        self.layer.shadowColor = [[UIColor blackColor] CGColor];
//        self.layer.shadowOffset = CGSizeMake(0.0f, 2.5f);
//        self.layer.shadowRadius = 1.9f;
//        self.layer.shadowOpacity = 0.9f;
        
        
    }
    return self;
}


- (void)reloadRatio{

//    if (self.layer.sublayers.count > 1) {
//        [self.layer.sublayers[0] removeFromSuperlayer];
//    }

  
//    NSLog(@"%d",self.layer.sublayers);
    
    

    
    for (int i = 0; i<  self.itemsCount; i++) {
        
        [self drawChartWithWidth:self.lineWidth withStrokeColor:[self.backGroundArray[i] CGColor] withStartAngle:[self.startAngleArray[i] floatValue] withEndAngle:[self.endAngleArray[i] floatValue]];
        
        
    }



}

- (void)initUIBezierPath{
    
    
 
    
//    [self drawChartWithWidth:self.lineWidth withStrokeColor:RGBA(157, 229, 243, 1).CGColor withStartAngle:M_PI*1.05 withEndAngle:M_PI*1.99];
    
    
    
//    [self drawChartWithWidth:self.lineWidth withStrokeColor:RGBA(157, 229, 243, 1).CGColor withStartAngle:M_PI*1.05 withEndAngle:M_PI*1.99];
//    
//    [self drawChartWithWidth:self.lineWidth withStrokeColor:RGBA(250, 107, 103, 1).CGColor withStartAngle:M_PI*0.51 withEndAngle:M_PI*0.99];
//    
//     [self drawChartWithWidth:self.lineWidth withStrokeColor:RGBA(254, 225, 133, 1).CGColor withStartAngle:M_PI*0.05 withEndAngle:M_PI*0.49];
}

- (void)drawChartWithWidth:(CGFloat)lineWidth withStrokeColor:(CGColorRef)strokeColor withStartAngle:(CGFloat)startAngle withEndAngle:(CGFloat)endAngle{



    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:self.center
                    radius:100
                startAngle:startAngle
                  endAngle:endAngle
                 clockwise:YES];

    /**创建带形状的图层*/
    CAShapeLayer *_shapeLayer=[CAShapeLayer layer];
    _shapeLayer.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _shapeLayer.position=self.center;
    _shapeLayer.path=path.CGPath;
    _shapeLayer.strokeColor = strokeColor;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.lineWidth = lineWidth;
    
    [self.layer addSublayer:_shapeLayer];
    
    [self animateChart:_shapeLayer];
    

//    [self startAnimationWithPath:path.CGPath AnimationDuration:3 withLayer:_shapeLayer];
}

- (void)animateChart:(CAShapeLayer *)pathLayer {
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.delegate = self;
    pathAnimation.fromValue = @0.0;
    pathAnimation.toValue = @1.0;
    [pathLayer addAnimation:pathAnimation forKey:@"path"];
    
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    
 NSArray *aa =   self.layer.sublayers;
    
    
    NSLog(@"%lu",(unsigned long)aa.count);
//    for (CAShapeLayer *layer in ) {
//        [layer removeAllAnimations];
//        [layer removeFromSuperlayer];
//        
//    }
//
//    
//    for (int index = self.layer.sublayers.count; self.layer.sublayers.count; index--) {
//    
//        
//        
//        CAShapeLayer *layer = self.layer.sublayers[index];
//        
////        [layer removeAllAnimations];
//        
//        if (layer != nil) {
//             [layer removeFromSuperlayer];
//            layer = nil;
//        }
//       
//        
//    }
////    for (CAShapeLayer *layer in self.layer.sublayers) {
//        [layer removeAllAnimations];
//        [layer removeFromSuperlayer];
//        
//    }


}


@end


