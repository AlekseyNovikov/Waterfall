//
//  WFPhotosDataSource.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "WFPhotosDataSource.h"
#import "UICollectionViewCell+WFUtils.h"


@interface WFPhotosDataSource()
@property (nonatomic, copy) NSArray *photos;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) NSString *loadingCellIdentifier;
@property (nonatomic, copy) CellConfigureBlock configureBlock;
@end

@implementation WFPhotosDataSource 

- (id)initWithPhotos:(NSArray *)photos cellIdentifier:(NSString *)identifier configureCellBlock:(CellConfigureBlock)configureBlock {
    if (self = [super init]) {
        self.photos = photos ? photos : @[];
        self.cellIdentifier = identifier;
        self.configureBlock = [configureBlock copy];
    }
    return self;
}

- (void)updateWithData:(NSArray *)photos {
    self.photos = [self.photos arrayByAddingObjectsFromArray:photos];
}

#pragma mark <UICollectionViewDataSource>

- (id)photoAtIndexPath:(NSIndexPath*)indexPath {
    return self.photos[(NSUInteger)indexPath.row];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    if (self.configureBlock) {
        self.configureBlock(cell, [self photoAtIndexPath:indexPath]);
    }
    return cell;
}

@end
