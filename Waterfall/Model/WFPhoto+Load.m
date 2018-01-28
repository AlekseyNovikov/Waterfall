//
//  WFPhoto+Load.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "WFPhoto+Load.h"
#import "WFNetworkService.h"
#import "WFNetworkRequest.h"
#import "NSDictionary+JSON.h"


@implementation WFPhoto (Load)

+(void)loadPhotosPage:(NSUInteger)page withCompletion:(void (^)(NSArray<WFPhoto *> *, NSUInteger , NSError *))completionBlock {
    NSDictionary *params = @{
                           @"only":@"Abstract",
                           @"image_size":@"2,4",
                           @"page": [NSString stringWithFormat:@"%lu", (unsigned long)page]
                           };
    
    NSURLRequest *requerst = [WFNetworkRequest requestForResource:@"photos" withParams:params];
    
    [[WFNetworkService sharedInstance] loadRequest:requerst withCompletion:^(id json, NSError *error) {
        if (completionBlock) {
            if (error) {
                completionBlock(nil, 0, error);
            } else {
                NSUInteger totalPages = [json unsignedLongForKey:@"total_pages"];
                NSMutableArray *parsed = [NSMutableArray new];
                NSArray *photos = [((NSDictionary*)json) arrayForKey:@"photos"];
                if (photos.count) {
                    for (NSDictionary *photoDic in photos) {
                        [parsed addObject:[[WFPhoto alloc] initWithDictionary:photoDic]];
                    }
                }
                completionBlock(parsed, totalPages, nil);
            }
        }
    }];
}

@end
