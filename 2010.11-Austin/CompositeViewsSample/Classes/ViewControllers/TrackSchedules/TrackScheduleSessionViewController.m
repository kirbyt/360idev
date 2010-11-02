//
//  TrackScheduleSessionViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/2/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "TrackScheduleSessionViewController.h"
#import "Speakers.h"


@implementation TrackScheduleSessionViewController

@synthesize titleLabel = _titleLabel;
@synthesize timeLabel = _timeLabel;
@synthesize speakerIcon = _speakerIcon;
@synthesize speakerBio = _speakerBio;

- (void)dealloc
{
   [_titleLabel release], _titleLabel = nil;
   [_timeLabel release], _timeLabel = nil;
   [_speakerIcon release], _speakerIcon = nil;
   [_speakerBio release], _speakerBio = nil;
   [_data release], _data = nil;
   [_speakers release], _speakers = nil;
   
   [super dealloc];
}

- (void)viewDidUnload
{
   [super viewDidUnload];
   
   [self setTitleLabel:nil];
   [self setTimeLabel:nil];
   [self setSpeakerIcon:nil];
   [self setSpeakerBio:nil];
}

- (void)setup
{
   _speakers = [[Speakers alloc] init];
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

- (void)setData:(NSDictionary*)data
{
   _data = [data retain];
   [_titleLabel setText:[_data objectForKey:kSessionTitle]];
   [_timeLabel setText:[_data objectForKey:kSessionTimeSlot]];

   NSString *speakerName = [_data objectForKey:kSessionSpeakerName];
   NSDictionary *speaker = [_speakers speakerNamed:speakerName];
   NSString *imageName = [speaker objectForKey:kSpeakerImage];
   UIImage *image = [UIImage imageNamed:imageName];
   NSString *bio = [speaker objectForKey:kSpeakerBio];
   
   [_speakerIcon setImage:image];
   [_speakerBio loadHTMLString:bio baseURL:nil];
}

@end
