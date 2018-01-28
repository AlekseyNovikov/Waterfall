//
//  WFPhotoCell.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "WFPhotoCell.h"
#import "WFPhoto.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface WFPhotoCell()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end

@implementation WFPhotoCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureWithObject:(WFPhoto *)object {
    self.authorLabel.text = object.author;
    self.titleLabel.text = object.title;
    [self.photoImageView setImageWithURL:object.photoURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

+ (CGFloat)staticHeight {
    return 66.f;
}

@end
