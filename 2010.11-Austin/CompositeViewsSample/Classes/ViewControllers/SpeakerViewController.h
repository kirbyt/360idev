//
//  SpeakerViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SpeakerViewController : UIViewController 
{
   UIImageView *_imageView;
   UIWebView *_webView;
   NSArray *_speakers;
   NSInteger _nextSpeakerIndex;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSArray *speakers;

@end
