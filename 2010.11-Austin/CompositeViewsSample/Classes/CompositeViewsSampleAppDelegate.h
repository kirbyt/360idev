//
//  CompositeViewsSampleAppDelegate.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompositeViewsSampleAppDelegate : NSObject <UIApplicationDelegate> 
{
   UIWindow *_window;
   UIViewController *_appLayoutViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *appLayoutViewController;

@end

