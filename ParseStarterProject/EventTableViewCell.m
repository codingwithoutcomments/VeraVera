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

@end
