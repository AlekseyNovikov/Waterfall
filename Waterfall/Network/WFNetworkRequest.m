//
//  WFNetworkRequest.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "WFNetworkRequest.h"

NSString * const urlAPIBaseURL = @"https://api.500px.com/v1/";
#pragma mark - API key
NSString * const consumerKey = @"KvOmAIiUyOlihwz4JkUdAjB2zXzKnvek5169dPmV";

@implementation WFNetworkRequest

+ (NSURLRequest *)requestForResource:(NSString *)resource withParams:(NSDictionary *)params {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:[urlAPIBaseURL stringByAppendingString:resource]];
    components.queryItems = @[[[NSURLQueryItem alloc] initWithName:@"consumer_key" value:consumerKey]];
    components.queryItems = [components.queryItems arrayByAddingObjectsFromArray:[self queryItemsFromDictinonary:params]];
 
    return [NSURLRequest requestWithURL:components.URL];
}


#pragma mark - Private
+ (NSArray<NSURLQueryItem *> *)queryItemsFromDictinonary:(NSDictionary *)queryDictionary {
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in queryDictionary) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:queryDictionary[key]]];
    }
    return [queryItems copy];
}


@end
