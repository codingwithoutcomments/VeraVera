//
//  EventTableViewCell.m
//  VeraVera
//
//  Created by CReath on 11/1/12.
//
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell

@synthesize title;
@synthesize imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)populateImage:(NSString *)imageURL{
    
    NSString * url = [imageURL stringByReplacingOccurrencesOfString:@"/_/" withString:@"/126s/"];
    [self.imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"VeraVera.jpg"]];
    
}

-(void)populateHeader:(NSString *)header maxWidth:(int)maxWidth{
    
    CGSize maximumLabelSize = CGSizeMake(maxWidth,9999);
    CGSize expectedLabelSize = [header sizeWithFont:self.title.font constrainedToSize:maximumLabelSize lineBreakMode:self.title.lineBreakMode];
    
    //adjust the label the the new height.
    CGRect newFrame = self.title.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.size.width = expectedLabelSize.width;
    self.title.frame = newFrame;
    [self.title sizeToFit];
}

@end
