//
//  KMD_PreviousTripsTableViewCell.h
//  FinalProject
//
//  Created by Masha on 18.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMD_PreviousTripsTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *routeName;
@property (nonatomic, strong) UILabel *routeDescription;
@property (nonatomic, strong) UIImageView *routeView;

- (CGFloat)cellHeight;

@end
