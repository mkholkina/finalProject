//
//  KMD_PreviousTripsTableViewCell.m
//  FinalProject
//
//  Created by Masha on 18.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_PreviousTripsTableViewCell.h"

static const CGSize imageSize = {50.f, 50.f};
static const CGFloat elementsOffset = 10.f;
static const CGFloat labelHeight = 20.f;
static NSString *const routeImage = @"tmpPicForList";

@implementation KMD_PreviousTripsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _routeName = [UILabel new];
        _routeName.textColor = [UIColor redColor];
        [self.contentView addSubview:_routeName];
        
        _routeDescription = [UILabel new];
        _routeDescription.textColor = [UIColor blackColor];
        _routeDescription.numberOfLines = 3;
        [self.contentView addSubview:_routeDescription];
        
        _routeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:routeImage]];
        [_routeView setContentMode:UIViewContentModeScaleToFill];
        [self.contentView addSubview:_routeView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat cellTextOffset = imageSize.width + elementsOffset * 2;
    CGSize cellSize = {CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame)};
    
    self.routeView.frame = CGRectMake(elementsOffset,
                                      (cellSize.height - imageSize.height)/2,
                                      imageSize.width,
                                      imageSize.height);
    
    self.routeName.frame = CGRectMake(cellTextOffset,
                                      elementsOffset,
                                      cellSize.width - cellTextOffset - elementsOffset,
                                      labelHeight);
    
    self.routeDescription.frame = CGRectMake(cellTextOffset,
                                             CGRectGetMaxY(self.routeName.frame) + elementsOffset,
                                             cellSize.width - cellTextOffset - elementsOffset,
                                             labelHeight*2);
}

- (CGFloat)cellHeight
{
    CGFloat height = CGRectGetMaxY(self.routeDescription.frame) + elementsOffset * 10;
    return height;
}

@end
