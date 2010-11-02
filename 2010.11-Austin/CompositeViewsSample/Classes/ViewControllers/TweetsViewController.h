//
//  TweetsViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTwitterClient.h"

@class SimpleTwitterClient;

@interface TweetsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SimpleTwitterClientDelegate>
{
   UITableView *_tableView;
   SimpleTwitterClient *_twitter;
   NSArray *_data;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

- (IBAction)refresh;

@end
