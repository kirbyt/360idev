//
//  ScheduleViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "ScheduleViewController.h"
#import "UIViewController+KTCompositeView.h"


@implementation ScheduleViewController

@synthesize placeholderNavigation = _placeholderNavigation;
@synthesize placeholderContent = _placeholderContent;
@synthesize contentViewController = _contentViewController;
@synthesize navigationViewController = _navigationViewController;
@synthesize data = _data;

- (void)dealloc
{
   [_contentViewController release], _contentViewController = nil;
   [_navigationViewController release], _navigationViewController = nil;
   [_placeholderNavigation release], _placeholderNavigation = nil;
   [_placeholderContent release], _placeholderContent = nil;
   
   [_data release], _data = nil;
   
   [super dealloc];
}

- (id)init
{
   self = [super initWithNibName:@"ScheduleView" bundle:nil];
   if (self) {
      
   }
   return self;
}

- (void)viewDidUnload
{
   [super viewDidUnload];
   
   [self setContentViewController:nil];
   [self setNavigationViewController:nil];
   [self setPlaceholderNavigation:nil];
   [self setPlaceholderContent:nil];
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   [self addSubview:[_contentViewController view] toPlaceholder:_placeholderContent];
   [self addSubview:[_navigationViewController view] toPlaceholder:_placeholderNavigation];
}


@end