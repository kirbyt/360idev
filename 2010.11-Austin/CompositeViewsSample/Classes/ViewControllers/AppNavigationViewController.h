//
//  AppNavigationViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppNavigationViewController : UIViewController
{
   RootViewController *_rootViewController;
}

@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;

- (IBAction)itemTouched:(id)sender;


@end
