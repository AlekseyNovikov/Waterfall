//
//  WFPhotosDataSource.h
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CellConfigureBlock)(id cell, id row);

@interface WFPhotosDataSource : NSObject <UICollectionViewDataSource>

- (id)initWithPhotos:(NSArray *)photos
     cellIdentifier:(NSString *)identifier
 configureCellBlock:(CellConfigureBlock)configureBlock;

- (void)updateWithData:(NSArray *)photos;

@property (nonatomic, copy, readonly) NSArray *photos;

- (id)photoAtIndexPath:(NSIndexPath*)indexPath;


@end
