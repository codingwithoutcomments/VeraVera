//
//  EventTableViewCell.h
//  VeraVera
//
//  Created by CReath on 11/1/12.
//
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFnetworking.h>
#import <AFHTTPClient.h>

@interface EventTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel * title;
@property (nonatomic, strong) IBOutlet UIImageView * imageView;

-(void)populateHeader:(NSString *)header maxWidth:(int) maxWidth;
-(void)populateImage:(NSString *)imageURL;
-(Boolean)isImageDefault;
-(void)addGradient;

@end
