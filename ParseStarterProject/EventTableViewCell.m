//
//  EventTableViewCell.m
//  VeraVera
//
//  Created by CReath on 11/1/12.
//
//

#import "EventTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

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
    
    //adds a frame to the UIImage
    CALayer *layer = self.imageView.layer;
    [layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [layer setBorderWidth:4.0f];
    [layer setShadowColor: [UIColorFromRGB(0xE2E3E3) CGColor]];
    [layer setShadowOpacity:0.9f];
    [layer setShadowOffset: CGSizeMake(1, 3)];
    [layer setShadowRadius:1.0];
    [self.imageView setClipsToBounds:NO];
    
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

-(void)addGradient{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 74)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[UIColorFromRGB(0xFEFEFE) CGColor], (id)[UIColorFromRGB(0xF2F6F6) CGColor], nil];
    [view.layer insertSublayer:gradient atIndex:0];
    [self insertSubview:view atIndex:0];
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 74, 320, 74)];
    secondView.backgroundColor = UIColorFromRGB(0XF2F6F6);
    [self insertSubview:secondView atIndex:0];
}

@end
