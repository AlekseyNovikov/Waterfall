//
//  WFPhotosViewController.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "UICollectionViewCell+WFUtils.h"
#import "WFPhotosViewController.h"
#import "WFPhotosDataSource.h"
#import "WFPhotoCell.h"


#import "WFPhoto+Load.h"

#import <CHTCollectionViewWaterfallLayout/CHTCollectionViewWaterfallLayout.h>

@interface WFPhotosViewController ()<CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) WFPhotosDataSource *dataSource;
@property (nonatomic, strong) CHTCollectionViewWaterfallLayout *waterfallLayout;

@property (nonatomic, assign) NSUInteger curentPage;
@property (nonatomic, assign) NSUInteger totalPages;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *columnNumberButton;

@end

@implementation WFPhotosViewController
- (IBAction)addColumnPressed:(UIBarButtonItem *)sender {
    self.waterfallLayout.columnCount++;
    if (self.waterfallLayout.columnCount > 6) {
        self.waterfallLayout.columnCount = 1;
    }
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureCollectionView];
    
    [self loadMore];
}

- (void)configureCollectionView {
    self.collectionView.collectionViewLayout = self.waterfallLayout;
    [self.collectionView registerNib:[WFPhotoCell wf_nib] forCellWithReuseIdentifier:[WFPhotoCell wf_cellReuseIdentifier]];
    self.collectionView.dataSource = self.dataSource;
}

- (NSUInteger)curentPage {
    if (_curentPage <= 0) {
        _curentPage = 0;
    }
    return _curentPage;
}

- (WFPhotosDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[WFPhotosDataSource alloc] initWithPhotos:nil
                                                  cellIdentifier:[WFPhotoCell wf_cellReuseIdentifier]
                                           /*loadingCellIdentifier:[WFPhotoLoadingCell wf_cellReuseIdentifier]*/
                                              configureCellBlock:^(id<WFCollectionViewCellConfiguration> cell, WFPhoto *row) {
                                                  [cell configureWithObject:row];
                                              }];
    }
    return _dataSource;
}

- (CHTCollectionViewWaterfallLayout *)waterfallLayout {
    if(!_waterfallLayout){
        _waterfallLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _waterfallLayout.columnCount = 2;
    }
    return _waterfallLayout;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CHTCollectionViewWaterfallLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    WFPhoto *photo = [self.dataSource photoAtIndexPath:indexPath];
    CGFloat itemWidth = [collectionViewLayout itemWidthInSectionAtIndex:indexPath.section];
    CGFloat ratio = itemWidth / photo.width;
    return CGSizeMake(itemWidth, (photo.height * ratio) + [WFPhotoCell staticHeight]);
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == (self.dataSource.photos.count - 1)) {
        self.curentPage++;
        if (self.curentPage < self.totalPages) {
            [self loadMore];
        }
    }
}


- (void)loadMore {
    __weak typeof(self) _self = self;
    [WFPhoto loadPhotosPage:self.curentPage withCompletion:^(NSArray<WFPhoto *> *photos, NSUInteger totalPages, NSError *error) {
        _self.totalPages = totalPages;
        [_self.dataSource updateWithData:photos];
        [_self.collectionView reloadData];
    }];
}

@end
