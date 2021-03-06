//
//  HypnosisterAppDelegate.m
//  Hypnosister
//
//  Created by Steve Baker on 11/27/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "HypnosisterAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnosisterAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect wholeWindow = [window bounds];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:wholeWindow];
    [window addSubview:scrollView];
    
    // Make the scroll view content twice as large as the window
    CGRect reallyBigRect;
    reallyBigRect.origin = CGPointZero;
    reallyBigRect.size.width = wholeWindow.size.width * 2.0;
    reallyBigRect.size.height = wholeWindow.size.height * 2.0;
    [scrollView setContentSize:reallyBigRect.size];
    
    // Center it in the scroll view
    CGPoint offset;
    offset.x = wholeWindow.size.width * 0.5;
    offset.y = wholeWindow.size.height * 0.5;
    [scrollView setContentOffset:offset];
    
    // Enable zooming
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setMaximumZoomScale:5.0];
    [scrollView setDelegate:self];
    
    // Create the hypnosisView
    hypnosisView = [[HypnosisView alloc] initWithFrame:reallyBigRect];
    [hypnosisView setBackgroundColor:[UIColor clearColor]];
    // the window will retain its subview.
    [scrollView addSubview:hypnosisView];
    
    // release the views as soon as we are done with the references to them
    [scrollView release];
    
    // book method setStatusBarHidden:animated: is deprecated
    // replace with setStatusBarHidden:withAnimation:
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    
    [self.window makeKeyAndVisible];    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

// A dealloc method that will never get called because
// HypnosisAppDelegate will exist for the life of the application
- (void)dealloc {
    
    [hypnosisView release];
    // don't worry about setting scrollView delegate to nil, app is ending
    
    // When the window is released, it releases its subviews.
    [window release];
    
    [super dealloc];
}


#pragma mark -
#pragma mark UIScrollViewDelegate method
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return hypnosisView;
}

@end
