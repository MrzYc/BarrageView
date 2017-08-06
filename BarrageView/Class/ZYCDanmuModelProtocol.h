//
//  ZYCDanmuModelProtocol.h
//  BarrageView
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZYCDanmuModelDelegate <NSObject>

/** 弹幕标题, 可以提供富文本 */
@property (nonatomic, readonly) NSMutableAttributedString *attributeContent;
/** 弹幕开始弹出时间点 */
@property (nonatomic, readonly) NSTimeInterval beginTime;
/** 弹幕存活时间(动画时间) */
@property (nonatomic, readonly) NSTimeInterval liveTime;

@end
