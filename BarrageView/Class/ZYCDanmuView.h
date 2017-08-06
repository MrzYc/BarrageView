//
//  ZYCDanmuView.h
//  BarrageView
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYCDanmuModelProtocol.h"

typedef void(^LoadImageBlock)(UIImageView *imageView, NSURL *url);


@interface ZYCDanmuView : UIView

+ (instancetype)danmuViewWithDanmuM:(id<ZYCDanmuModelDelegate>)danmuM;

@property (nonatomic, strong) id<ZYCDanmuModelDelegate> danmuM;

/**
 *  用于加载图片的代码块, 必须赋值
 */
//@property (nonatomic, copy) LoadImageBlock loadBlock;

// 在某个位置显示星星
- (void)showStars:(CGPoint)point;

@end
