//
//  VeraVeraApiClient.m
//  VeraVera
//
//  Created by CReath on 10/26/12.
//
//

#import "VeraVeraApiClient.h"

#define VeraVeraBaseURLString @"http://127.0.0.1:8000"
#define VeraVeraAPIToken @"letspretendwedontexist"

@implementation VeraVeraApiClient

+ (id)sharedInstance {
    static VeraVeraApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[VeraVeraApiClient alloc] initWithBaseURL:
                            [NSURL URLWithString:VeraVeraBaseURLString]];
        
        [__sharedInstance setParameterEncoding:AFJSONParameterEncoding];
        [__sharedInstance setDefaultHeader:@"Accept" value:@"application/json"];
        [__sharedInstance registerHTTPOperationClass:[AFJSONRequestOperation class]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self setDefaultHeader:@"x-api-token" value:VeraVeraAPIToken];
    }
    
    return self;
}

@end
