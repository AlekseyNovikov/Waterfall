//
//  WFNetworkService.h
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFNetworkService : NSObject
+ (WFNetworkService *)sharedInstance;
- (void)loadRequest:(NSURLRequest *)request withCompletion:(void(^)(id json, NSError *error))completionBlock;

@end
