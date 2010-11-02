//
//  UIImageView+KTImageDownload.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebImage.h"


@interface UIImageView (KTImageDownload) <WebImageDelegate>

- (void)setImageWithURL:(NSURL *)url;

@end
