//
//  AppLayoutViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "RootViewController.h"
#import "TweetsViewController.h"
#import "ScheduleViewController.h"
#import "FullScheduleViewController.h"
#import "UIViewController+KTCompositeView.h"


@implementation RootViewController

@synthesize placeholderContent = _placeholderContent;
@synthesize placeholderAppNavigation = _placeholderAppNavigation;
@synthesize placeholderSpeaker = _placeholderSpeaker;
@synthesize contentViewController = _contentViewController;
@synthesize appNavigationViewController = _appNavigationViewController;
@synthesize speakerViewController = _speakerViewController;

- (void)dealloc
{
   [_placeholderContent release], _placeholderContent = nil;
   [_placeholderAppNavigation release], _placeholderAppNavigation = nil;
   [_placeholderSpeaker release], _placeholderSpeaker = nil;
   [_contentViewController release], _contentViewController = nil;
   [_appNavigationViewController release], _appNavigationViewController = nil;
   [_speakerViewController release], _speakerViewController = nil;
   
   [_viewControllerCache release], _viewControllerCache = nil;
   
   [super dealloc];
}

- (void)setup
{
   _viewControllerCache = [[NSMutableDictionary alloc] init];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
   self = [super initWithCoder:aDecoder];
   if (self) {
      [self setup];
   }
   return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   if (self) {
      [self setup];
   }
   return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   [self addSubview:[_contentViewController view] toPlaceholder:_placeholderContent];
   [self addSubview:[_appNavigationViewController view] toPlaceholder:_placeholderAppNavigation];
   [self addSubview:[_speakerViewController view] toPlaceholder:_placeholderSpeaker];
}

- (void)viewDidUnload
{
   [super viewDidUnload];

   [self setContentViewController:nil];
   [self setAppNavigationViewController:nil];
   [self setSpeakerViewController:nil];
   [self setPlaceholderContent:nil];
   [self setPlaceholderAppNavigation:nil];
   [self setPlaceholderSpeaker:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
   return YES;
}


#pragma mark -
#pragma mark View Helpers

- (void)slideInView:(UIView *)newView
{
   // Grab reference to view that will slide out.
   UIView *bottomView = [[_placeholderContent subviews] lastObject];
   
   // Don't do anything if the new view is already visible.
   if (bottomView == newView) {
      return;
   }
   
   // Size the new view.
   CGRect frame = [_placeholderContent bounds];
   frame = CGRectOffset(frame, frame.size.width, 0);
   [newView setFrame:frame];
   
   // Add new view if not already present.
   NSUInteger viewIndex = [[_placeholderContent subviews] indexOfObject:newView];
   if (viewIndex == NSNotFound) {
      [_placeholderContent addSubview:newView];
   } else {
      [_placeholderContent bringSubviewToFront:newView];
   }
   
   // Animate old view out and new view in.
   [UIView beginAnimations:@"slideInContent" context:nil];
   [UIView setAnimationDuration:0.4];
   
   // Slide out the bottom view.
   frame = [bottomView frame];
   frame = CGRectOffset(frame, -frame.size.width, 0);
   [bottomView setFrame:frame];
   
   // Slide in the new view.
   frame = [newView frame];
   frame = CGRectOffset(frame, -frame.size.width, 0);
   [newView setFrame:frame];
   
   [UIView commitAnimations];
}

- (void)displayViewForKey:(NSString *)key viewControllerClass:(Class)class
{
   [_currentContentViewController viewWillDisappear:YES];
   
   UIViewController *vc = [_viewControllerCache objectForKey:key];
   if (vc == nil) {
      vc = [[class alloc] init];
      [_viewControllerCache setObject:vc forKey:key];
      [vc release];
   }
   [self slideInView:[vc view]];
   
   _currentContentViewController = vc;
   [_currentContentViewController viewWillAppear:YES];
}


#pragma mark -
#pragma mark View Actions

- (void)showScheduleForTrack:(NSInteger)track
{
   // Retrieve data for the track.
   NSArray *data = [NSArray array];
   
   NSString *cacheKey = nil;
   switch (track) {
      case kScheduleHandsOn:
         cacheKey = @"HandsOn";
         break;
      case kScheduleBusiness:
         cacheKey = @"Business";
         break;
      case kScheduleSightsAndSounds:
         cacheKey = @"SightsAndSounds";
         break;
      case kScheduleDevTips:
         cacheKey = @"DevTips";
         break;
   }
   
   [self displayViewForKey:cacheKey viewControllerClass:[ScheduleViewController class]];
   
   if ([_currentContentViewController isKindOfClass:[ScheduleViewController class]]) {
      ScheduleViewController *vc = (ScheduleViewController *)_currentContentViewController;
      [vc setData:data];
   }
}

- (void)showFullSchedule
{
   [self displayViewForKey:@"FullSchedule" viewControllerClass:[FullScheduleViewController class]];
}

- (void)showTwitterFeed
{
   [self displayViewForKey:@"TwitterFeed" viewControllerClass:[TweetsViewController class]];
}

@end
