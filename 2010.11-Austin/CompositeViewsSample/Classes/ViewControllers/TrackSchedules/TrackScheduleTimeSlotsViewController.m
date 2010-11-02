//
//  TrackScheduleTimeSlotsViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/2/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "TrackScheduleTimeSlotsViewController.h"
#import "TrackScheduleSessionViewController.h"


@implementation TrackScheduleTimeSlotsViewController

@synthesize tableView = _tableView;
@synthesize navBar = _navBar;
@synthesize contentController = _contentController;

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
      NSString *trackTitle = [_data objectForKey:kTrackTitle];
      [item setTitle:trackTitle];
   }
   
   [_tableView reloadData];
}


#pragma mark -
#pragma mark UITableView delegate and data methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
   NSArray *days = [_data objectForKey:kTrackDays];
   NSDictionary *day = [days objectAtIndex:section];
   NSArray *sessions = [day objectForKey:kDaysSessions];
   return [sessions count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   NSArray *days = [_data objectForKey:kTrackDays];
   return [days count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   NSArray *days = [_data objectForKey:kTrackDays];
   NSDictionary *day = [days objectAtIndex:section];
   NSString *title = [day objectForKey:kDaysDay];
   return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *identifier = @"TrackScheduleTimeSlotCell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
   }
   
   NSArray *days = [_data objectForKey:kTrackDays];
   NSDictionary *day = [days objectAtIndex:[indexPath section]];
   NSArray *sessions = [day objectForKey:kDaysSessions];
   NSDictionary *session = [sessions objectAtIndex:[indexPath row]];
   [[cell textLabel] setText:[session objectForKey:kSessionTitle]];
   [[cell detailTextLabel] setText:[session objectForKey:kSessionTimeSlot]];

   return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSArray *days = [_data objectForKey:kTrackDays];
   NSDictionary *day = [days objectAtIndex:[indexPath section]];
   NSArray *sessions = [day objectForKey:kDaysSessions];
   NSDictionary *session = [sessions objectAtIndex:[indexPath row]];
   [_contentController setData:session];
   
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
