//
//  AppLayoutViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "AppLayoutViewController.h"


@implementation AppLayoutViewController

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
   
   [super dealloc];
}

- (void)addSubview:(UIView *)subview toPlaceholder:(UIView *)placeholder
{
   // Size the subview to fill the placeholder.
   CGRect frame = [placeholder bounds];
   [subview setFrame:frame];
   // Replace the background color in the placeholder with the 
   // color used in the subview.
   [placeholder setBackgroundColor:[subview backgroundColor]];
   
   [placeholder addSubview:subview];
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

@end
