//
//  FlamingoShhh.m
//  FlamingoShhh
//
//  Created by Adam Bell on 11/13/2013.
//  Copyright (c) 2013 Adam Bell. All rights reserved.
//
//  loljk, not copyright
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

@class FGOChatListViewController;

void _newPlayReceivedMessageSound(id self, SEL _cmd) {
    return;
}

void objc_methodHook(Class c, SEL sel, IMP newImp, IMP *origImp) {
    Method m = class_getInstanceMethod(c, sel);
    IMP orig = method_setImplementation(m, newImp);
    if(origImp)
        *origImp = orig;
}

__attribute__((constructor))
static void hax() {
    @autoreleasepool {
        Class _FGOChatListViewController = objc_getClass("FGOChatListViewController");

        objc_methodHook(_FGOChatListViewController, NSSelectorFromString(@"playReceivedMessageSound"), (IMP)_newPlayReceivedMessageSound, NULL);
    }
}