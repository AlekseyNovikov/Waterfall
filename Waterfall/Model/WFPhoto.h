//
//  WFPhoto.h
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM (NSInteger, WFPhotoScale)
{
    WFPhotoScalePreview = 2,
    WFPhotoScalePhoto = 4,
};


@interface WFPhoto : NSObject

@property (nonatomic, strong) NSNumber *photoID;
@property (nonatomic, strong) NSURL *photoPreviewURL;
@property (nonatomic, strong) NSURL *photoURL;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *photoDescription;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
