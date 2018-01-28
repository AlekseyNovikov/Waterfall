//
//  WFNetworkRequest.h
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFNetworkRequest : NSObject

+ (NSURLRequest *)requestForResource:(NSString *)resource withParams:(NSDictionary *)params;

@end
