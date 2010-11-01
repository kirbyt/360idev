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
         [_rootViewController showScheduleForTrack:kScheduleHandsOn];
         break;
      case buttonBusiness:
         [_rootViewController showScheduleForTrack:kScheduleBusiness];
         break;
      case buttonSights:
         [_rootViewController showScheduleForTrack:kScheduleSightsAndSounds];
         break;
      case buttonDevTips:
         [_rootViewController showScheduleForTrack:kScheduleDevTips];
         break;
      case buttonFullSchedule:
         [_rootViewController showFullSchedule];
         break;
      case buttonTwitter:
         [_rootViewController showTwitterFeed];
         break;
   }
}

@end
