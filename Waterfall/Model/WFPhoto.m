//
//  WFPhoto.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "WFPhoto.h"
#import "NSDictionary+JSON.h"

@implementation WFPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        self.photoID = [dict objectForKey:@"id"];
        NSDictionary *userDict = [dict dictionaryForKey:@"user"];
        self.author = [userDict stringForKey:@"username"];
        self.title = [dict stringForKey:@"name"];
        self.photoDescription = [dict stringForKey:@"description"];
        self.width = [dict floatForKey:@"width"];
        self.height = [dict floatForKey:@"height"];
        
        NSArray *images = [dict arrayForKey:@"images"];
        for (NSDictionary *imgDict in images) {
            switch ([imgDict[@"size"] integerValue]) {
                case WFPhotoScalePreview:
                    self.photoPreviewURL = [NSURL URLWithString:[imgDict stringForKey:@"https_url"]];
                    break;
                case WFPhotoScalePhoto:
                    self.photoURL = [NSURL URLWithString:[imgDict stringForKey:@"https_url"]];
                    break;
                default:
                    break;
            }
        }
    }
    return self;
}
@end
