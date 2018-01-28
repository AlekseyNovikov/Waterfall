//
//  UICollectionViewCell+WFUtils.h
//  Waterfall
//
//  Created by Alexey Novikov  on 28/01/2018.
//  Copyright © 2018 Alexey Novikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (WFUtils)

+ (UINib *)wf_nib;
+ (NSString *)wf_cellReuseIdentifier;

@end
