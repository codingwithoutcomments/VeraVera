//
//  EventsTableViewController.h
//  VeraVera
//
//  Created by CReath on 10/25/12.
//
//

#import <UIKit/UIKit.h>

@interface EventsTableViewController : UITableViewController
{
    IBOutlet UITableViewCell * eventCell;
}

- (UITableViewCell *) eventCell;

@property (nonatomic, strong) NSArray* events;

@end


