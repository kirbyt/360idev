//
//  TweetsViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "TweetsViewController.h"
#import "UIImageView+KTImageDownload.h"


// Private properties.
@interface TweetsViewController ()
@property (nonatomic, retain) NSArray *data;
@end


@implementation TweetsViewController

@synthesize tableView = _tableView;
@synthesize data = _data;

- (void)dealloc
{
   NSLog(@"dealloc - this is bad.");
   
   [_tableView release], _tableView = nil;
   [_data release], _data = nil;
   [_twitter release], _twitter = nil;
   
   [super dealloc];
}

- (void)viewDidUnload
{
   [super viewDidUnload];
   
   [self setTableView:nil];
}

- (id)init
{
   self = [super initWithNibName:@"TweetsView" bundle:nil];
   if (self) {
      _twitter = [[SimpleTwitterClient alloc] init];
      [_twitter setDelegate:self];
   }
   return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];

   [self refresh];
}

- (void)refresh
{
   [_twitter retrieveTweetsForSearchTerm:@"360idev"];
}


#pragma mark -
#pragma mark SimpleTwitterClientDelegate methods

- (void)simpleTwitterClient:(SimpleTwitterClient *)client didFinishRetrievingTweets:(NSArray *)tweets
{
   [self setData:tweets];
   [_tableView reloadData];
}


#pragma mark -
#pragma mark UITableView delegate and data methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
   return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *identifier = @"TweetCell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
   }
   
   NSDictionary *tweet = [_data objectAtIndex:[indexPath row]];
   NSURL *url = [NSURL URLWithString:[tweet objectForKey:@"profile_image_url"]];
   [[cell imageView] setImageWithURL:url];
   [[cell textLabel] setText:[tweet objectForKey:@"text"]];
   
   return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
