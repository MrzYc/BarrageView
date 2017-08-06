//
//  ZYCDanmuBackView.h
//  BarrageView
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ZYCDanmuModelProtocol.h"
#import <UIKit/UIKit.h>


@protocol ZYCDanmuBackViewDelegate <NSObject>

/**
 当前时间
 */
@property (nonatomic, readonly) NSTimeInterval currentTime;

/**
 根据model 获取相应的弹幕视图(又外界来控制)
 
 @param model 弹幕模型
 
 @return 弹幕视图
 */
- (UIView *)danmuViewWithModel: (id<ZYCDanmuModelDelegate>)model;

- (void)danmuBackViewDidSelectDanmu: (UIView *)danmuView atPoint: (CGPoint)point;

@end

@interface ZYCDanmuBackView : UIView

@property (nonatomic, weak) id<ZYCDanmuBackViewDelegate> delegate;

/**
 弹幕模型数组, 只要外界向这个数组追加数据, 控件内部就会根据时间自动的弹出该弹幕
 */
@property (nonatomic, strong) NSMutableArray <id<ZYCDanmuModelDelegate>>*danmuMs;


- (void)pause;
- (void)resume;

@end
