//
//  MXMobileTools.h
//  ColumnarChart
//
//  Created by 李茂轩 on 15/10/12.
//  Copyright © 2015年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MXMobileTools : NSObject
+ (void)pushFromViewController:(UIViewController *)fromViewController toViewControllerName:(NSString *)className;
+ (id)getViewControllernstanceWithClassName:(NSString *)className;
@end
