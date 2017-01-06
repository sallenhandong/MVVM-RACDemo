//
//  UIView+SAEvents.m
//  SAMvvm
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UIView+SAEvents.h"
#import <objc/runtime.h>
@implementation UIView (SAEvents)

-(id<SAViewProtocol>)viewDelegate {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewDelegate:(id<SAViewProtocol>)viewDelegate {
    objc_setAssociatedObject(self, @selector(viewDelegate), viewDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (ViewEventsBlock)viewEventsBlock {
    return objc_getAssociatedObject(self, @selector(viewEventsBlock));
}

- (void)setViewEventsBlock:(ViewEventsBlock)viewEventsBlock {
    objc_setAssociatedObject(self, @selector(viewEventsBlock), viewEventsBlock, OBJC_ASSOCIATION_COPY);
}

- (void)sa_viewWithViewManger:(id<SAViewProtocol>)viewManger {
    if (viewManger) {
        self.viewDelegate = viewManger;
    }
}


@end
