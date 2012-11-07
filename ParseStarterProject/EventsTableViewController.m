//
//  EventsTableViewController.m
//  VeraVera
//
//  Created by CReath on 10/25/12.
//
//

#import "EventsTableViewController.h"
#import "VeraVeraApiClient.h"
#import "Event.h"
#import "EventTableViewCell.h"
#import <AFNetworking/AFnetworking.h>
#import <AFHTTPClient.h>
#import <AFJSONRequestOperation.h>

@interface EventsTableViewController ()

@end

@implementation EventsTableViewController

@synthesize events = _events;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Events";
    
    [[VeraVeraApiClient sharedInstance] getPath:@"/api/events/" parameters:nil success:^(AFHTTPRequestOperation *operation, id response){
        
                                          NSMutableArray * events = [NSMutableArray array];
                                          for(id eventDictionary in [response objectForKey:@"events"]){
                                              Event * event = [[Event alloc] initWithDictionary:eventDictionary];
                                              [events addObject:event];
                                          }
                                            self.events = events;
                                            [self.tableView reloadData];
        
                                          }
                                          failure:^(AFHTTPRequestOperation *operation, NSError *error){
                                              
                                              NSLog(@"Errors Fetching Events");
                                              
                                          }];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        NSArray * loadTopLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"EventTableViewCell" owner:self options:nil];
        for (id currentObject in loadTopLevelObjects){
            if([currentObject isKindOfClass:[EventTableViewCell class]]){
                cell = (EventTableViewCell * ) currentObject;
            }
        }
    }
    
    Event * event = [self.events objectAtIndex:indexPath.row];
    cell.title.text = event.name;
    
    int maxLabelWidth = 280;
    if(![self isDefaultImage:event.imageLink]){
        [cell populateImage:event.imageLink];
        maxLabelWidth = 182;
    }

    [cell populateHeader:event.name maxWidth:maxLabelWidth];
    
    
    return cell;
}

-(Boolean)isDefaultImage:(NSString *)imageURL{
    
    if([imageURL isEqualToString:@"http://placehold.it/126/&text=VeraVera"]) return true;
    
    return false;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
