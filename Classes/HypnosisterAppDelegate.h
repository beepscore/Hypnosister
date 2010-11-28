//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Steve Baker on 11/27/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;

@interface HypnosisterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HypnosisView *view;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

