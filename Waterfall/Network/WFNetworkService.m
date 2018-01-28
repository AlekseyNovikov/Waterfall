//
//  WFNetworkService.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "WFNetworkService.h"
#import <AFNetworking/AFNetworking.h>



@interface WFNetworkService()

@property (nonatomic, strong)AFURLSessionManager *manager;

@end


@implementation WFNetworkService

+ (WFNetworkService *)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WFNetworkService alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return self;
}


- (void)loadRequest:(NSURLRequest *)request withCompletion:(void(^)(id json, NSError *error))completionBlock {
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request
                                                     completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                         if (completionBlock) {
                                                             completionBlock(responseObject, error);
                                                         }
                                                     }];
    [dataTask resume];
}

@end
