//
//  WFPhoto+Load.h
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "WFPhoto.h"

@interface WFPhoto (Load)

+ (void)loadPhotosPage:(NSUInteger)page withCompletion:(void(^)(NSArray<WFPhoto *> *photos, NSUInteger totalPages, NSError *error))completionBlock;

@end
