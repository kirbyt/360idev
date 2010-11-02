//
//  TrackScheduleTimeSlotsViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/2/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "TrackScheduleTimeSlotsViewController.h"


@implementation TrackScheduleTimeSlotsViewController

@synthesize tableView = _tableView;
@synthesize navBar = _navBar;

- (void)dealloc
{
   [_tableView release], _tableView = nil;
   [_navBar release], _navBar = nil;
   [_data release], _data = nil;
   
   [super dealloc];
}

- (void)viewDidUnload
{
   [super viewDidUnload];
   
   [self setTableView:nil];
   [self setNavBar:nil];
}

- (void)setData:(NSDictionary *)data
{
   _data = [data retain];

   // Set title.
   id item = [[_navBar items] objectAtIndex:0];
   if ([item isKindOfClass:[UINavigationItem class]]) {
      NSString *trackTitle = [_data objectForKey:@"trackTitle"];
      [item setTitle:trackTitle];
   }
   
   [_tableView reloadData];
}


#pragma mark -
#pragma mark UITableView delegate and data methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
   NSArray *sessions = [_data objectForKey:@"sessions"];
   return [sessions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *identifier = @"TrackScheduleTimeSlotCell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
   }
   
   NSArray *sessions = [_data objectForKey:@"sessions"];
   NSDictionary *session = [sessions objectAtIndex:[indexPath row]];
   [[cell textLabel] setText:[session objectForKey:@"title"]];
   [[cell detailTextLabel] setText:[session objectForKey:@"timeSlot"]];

   return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
