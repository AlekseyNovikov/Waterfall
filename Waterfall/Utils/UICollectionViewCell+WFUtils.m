//
//  UICollectionViewCell+WFUtils.m
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import "UICollectionViewCell+WFUtils.h"

@implementation UICollectionViewCell (WFUtils)

+ (UINib *)wf_nib
{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
}

+ (NSString *)wf_cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
