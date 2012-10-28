//
//  VeraVeraApiClient.h
//  VeraVera
//
//  Created by CReath on 10/26/12.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPClient.h>
#import <AFNetworking/AFJSONRequestOperation.h>

@interface VeraVeraApiClient : AFHTTPClient

+ (id)sharedInstance;

@end
