//
//  ScheduleViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScheduleViewController : UIViewController
{
   UIView *_placeholderNavigation;
   UIView *_placeholderContent;
   UIViewController *_contentViewController;
   UIViewController *_navigationViewController;
   NSArray *_data;
}

@property (nonatomic, retain) IBOutlet UIView *placeholderNavigation;
@property (nonatomic, retain) IBOutlet UIView *placeholderContent;
@property (nonatomic, retain) IBOutlet UIViewController *contentViewController;
@property (nonatomic, retain) IBOutlet UIViewController *navigationViewController;
@property (nonatomic, retain) NSArray *data;

@end
