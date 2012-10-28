//
//  Event.h
//  VeraVera
//
//  Created by CReath on 10/27/12.
//
//

#import <Foundation/Foundation.h>

/*
 date = "2012-12-26T23:59:00";
 defaultStartTime = "2011-01-01T19:30:00";
 id = 508a9cfd4e7cd9140b00000b;
 imageLink = "http://userserve-ak.last.fm/serve/_/75083858/La+Sera+lasera1024x682.jpg";
 name = "La Sera, TacocaT, Chastity Belt ";
 "slugify_name" = "la-sera-tacocat-chastity-belt";
 */

@interface Event : NSObject

@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * imageLink;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
