//
//  UIImageView+KTImageDownload.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "UIImageView+KTImageDownload.h"


@implementation UIImageView (KTImageDownload)

- (void)setImageWithURL:(NSURL *)url
{
   // Show placeholder while we wait for the download.
   UIImage *placeholder = [UIImage imageNamed:@"Placeholder.png"];
   [self setImage:placeholder];
   
   // Download the requested image.
   WebImage *webImage = [[WebImage alloc] init];
   [webImage setDelegate:self];
   [webImage downloadImageWithURL:url];
}


#pragma mark -
#pragma mark WebImageDelegate Methods

- (void)webImage:(WebImage *)webImage didFinishWithImage:(UIImage *)image
{
   [self setImage:image];
   [webImage release];
}

- (void)webImage:(WebImage *)webImage didFailWithError:(NSError *)error
{
   [webImage release];
}


@end
