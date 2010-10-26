//
//  SpeakerViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "SpeakerViewController.h"
#import "Speakers.h"


@interface SpeakerViewController (KTPrivateMethods)
- (void)showSpeaker:(NSDictionary *)speaker;
- (void)nextSpeaker:(NSTimer *)timer;
@end

@implementation SpeakerViewController

@synthesize imageView = _imageView;
@synthesize webView = _webView;
@synthesize speakers = _speakers;

- (void)dealloc
{
   [_imageView release], _imageView = nil;
   [_webView release], _webView = nil;
   [_speakers release], _speakers = nil;
   
   [super dealloc];
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   _nextSpeakerIndex = 0;
   Speakers *speakers = [[Speakers alloc] init];
   [self setSpeakers:[speakers speakers]];
   
   if ([_speakers count] > 0) {
      [self nextSpeaker:nil];
   }
   
   [NSTimer scheduledTimerWithTimeInterval:30.0 target:self selector:@selector(nextSpeaker:) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
   [super view];
   
   [self setImageView:nil];
   [self setWebView:nil];
   [self setSpeakers:nil];
}

- (void)showSpeaker:(NSDictionary *)speaker
{
   NSString *imageName = [speaker objectForKey:kSpeakerImage];
   UIImage *image = [UIImage imageNamed:imageName];
   NSString *bio = [speaker objectForKey:kSpeakerBio];
   
   [_imageView setImage:image];
   [_webView loadHTMLString:bio baseURL:nil];
}

- (void)nextSpeaker:(NSTimer *)timer
{
   NSDictionary *speaker = [_speakers objectAtIndex:_nextSpeakerIndex];
   [self showSpeaker:speaker];

   _nextSpeakerIndex += 1;
   if (_nextSpeakerIndex >= [_speakers count]) {
      _nextSpeakerIndex = 0;
   }
}

@end
