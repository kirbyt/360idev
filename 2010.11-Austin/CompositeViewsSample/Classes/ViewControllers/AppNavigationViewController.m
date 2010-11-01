//
//  AppNavigationViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "AppNavigationViewController.h"
#import "RootViewController.h"

enum ButtonTagValues {
   buttonHandsOn = 1,
   buttonBusiness,
   buttonSights,
   buttonDevTips,
   buttonFullSchedule,
   buttonTwitter
};

@implementation AppNavigationViewController

@synthesize rootViewController = _rootViewController;

- (IBAction)itemTouched:(id)sender
{
   switch ([sender tag]) {
      case buttonHandsOn:
         break;
      case buttonBusiness:
         break;
      case buttonSights:
         break;
      case buttonDevTips:
         break;
      case buttonFullSchedule:
         break;
      case buttonTwitter:
         [_rootViewController showTwitterFeed];
         break;
   }
}

@end
