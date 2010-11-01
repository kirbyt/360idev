//
//  WebImage.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebImageDelegate;

@interface WebImage : NSObject 
{
   id<WebImageDelegate> _delegate;
   NSMutableData *_data;
}

@property (nonatomic, assign) id<WebImageDelegate> delegate;

- (void)downloadImageWithURL:(NSURL *)url;

@end


@protocol WebImageDelegate <NSObject>
@required
- (void)webImage:(WebImage *)webImage didFinishWithImage:(UIImage *)image;
- (void)webImage:(WebImage *)webImage didFailWithError:(NSError *)error;
@end