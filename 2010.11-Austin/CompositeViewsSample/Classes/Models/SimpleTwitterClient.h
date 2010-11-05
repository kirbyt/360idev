//
//  Tweets.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SimpleTwitterClientDelegate;

@interface SimpleTwitterClient : NSObject 
{
   id<SimpleTwitterClientDelegate> _delegate;
}

@property (nonatomic, assign) id<SimpleTwitterClientDelegate> delegate;


- (void)retrieveTweetsForSearchTerm:(NSString *)term;

@end

@protocol SimpleTwitterClientDelegate <NSObject>
@optional
- (void)simpleTwitterClient:(SimpleTwitterClient *)client didFinishRetrievingTweets:(NSArray *)tweets;
- (void)simpleTwitterClient:(SimpleTwitterClient *)client didFailWithError:(NSError *)error;
@end
