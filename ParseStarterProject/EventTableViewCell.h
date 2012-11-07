//
//  EventTableViewCell.h
//  VeraVera
//
//  Created by CReath on 11/1/12.
//
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel * title;
@property (nonatomic, strong) IBOutlet UIImageView * imageView;

-(void)populateHeader:(NSString *)header maxWidth:(int) maxWidth;

@end
