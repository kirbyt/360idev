//
//  TrackScheduleSessionViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/2/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Speakers;

@interface TrackScheduleSessionViewController : UIViewController 
{
   UILabel *_titleLabel;
   UILabel *_timeLabel;
   UIImageView *_speakerIcon;
   UIWebView *_speakerBio;
   NSDictionary *_data;
   Speakers *_speakers;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UIImageView *speakerIcon;
@property (nonatomic, retain) IBOutlet UIWebView *speakerBio;

- (void)setData:(NSDictionary*)data;

@end
