//
//  Event.m
//  VeraVera
//
//  Created by CReath on 10/27/12.
//
//

#import "Event.h"

@implementation Event

@synthesize name = _name;
@synthesize imageLink = _imageLink;

-(id)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    if(self){
        self.name = [dictionary objectForKey:@"name"];
        self.imageLink = [dictionary objectForKey:@"imageLink"];
    }
    
    return self;
}

@end
