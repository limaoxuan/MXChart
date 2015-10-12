//
//  MXMobileTools.m
//  ColumnarChart
//
//  Created by 李茂轩 on 15/10/12.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "MXMobileTools.h"

@implementation MXMobileTools
+ (UIStoryboard *)getStoryBoardWithStoryName:(NSString *)storyName{
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyName bundle:nil];
    return storyBoard;
    
}

+ (UIStoryboard *)getStoryBoard{
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return storyBoard;
    
}


+ (id)getViewControllernstanceWithClassName:(NSString *)className{
    
    
    id viewController = [[self getStoryBoard] instantiateViewControllerWithIdentifier:className];
    
    return viewController;
    
}

/**
 @brief  根据classname push
 @param fromViewController  从哪儿来
 @param className  去哪儿（类名字）
 @author 李茂轩
 
 */
+ (void)pushFromViewController:(UIViewController *)fromViewController toViewControllerName:(NSString *)className{
    
    id  toViewController =      [self getViewControllernstanceWithClassName:className];
    
    
    
    [fromViewController.navigationController pushViewController:toViewController animated:YES];
    
    
    
}
@end
