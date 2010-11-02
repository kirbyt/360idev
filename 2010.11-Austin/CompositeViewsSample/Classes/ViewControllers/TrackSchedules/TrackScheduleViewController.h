//
//  ScheduleViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrackScheduleTimeSlotsViewController;
@class TrackScheduleSessionViewController;

@interface TrackScheduleViewController : UIViewController
{
   UIView *_placeholderNavigation;
   UIView *_placeholderContent;
   TrackScheduleSessionViewController *_contentViewController;
   TrackScheduleTimeSlotsViewController *_navigationViewController;
   NSDictionary *_data;
}

@property (nonatomic, retain) IBOutlet UIView *placeholderNavigation;
@property (nonatomic, retain) IBOutlet UIView *placeholderContent;
@property (nonatomic, retain) IBOutlet TrackScheduleSessionViewController *contentViewController;
@property (nonatomic, retain) IBOutlet TrackScheduleTimeSlotsViewController *navigationViewController;


- (void)setData:(NSDictionary *)data;

@end
