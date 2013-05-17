//
//  MWUserHeaderViewController.m
//  MWPhotoBrowser
//
//  Created by Yulia Petryshena on 5/13/13.
//
//

#import "MWUserHeaderView.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface MWUserHeaderView ()





@end

@implementation MWUserHeaderView

- (id)init {
    
    self = [super init];
    if (self) {
        [self createHeader];
    }
    return self;
}

- (void)createHeader
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = headerView.frame;
    [_button addTarget:self action:@selector(userHeaderDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_button setTintColor:[UIColor colorWithRed:240./255 green:54./255 blue:140./255 alpha:1]];
    
    self.userAvatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(6, 7, 34, 31)];
    
    self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(53, 12, 258, 21)];
    self.userNameLabel.backgroundColor = [UIColor clearColor];
    
    [headerView addSubview:_button];
    [headerView addSubview:self.userAvatarImage];
    [headerView addSubview:self.userNameLabel];
    
    [self addSubview:headerView];
}

- (void)setup
{
    [self setupCaption];
    [self setupAvatar];
}


- (IBAction)userHeaderDidPressed:(id)sender
{
    [self.delegate didSelectHeaderObject:self.headerObject];
}

- (void)setupCaption
{
    self.userNameLabel.text = [self.headerObject getHeaderTitle];
    self.userNameLabel.textColor = [UIColor colorWithRed:1 green:0.2 blue:1 alpha:1];
    self.userNameLabel.font = [UIFont boldSystemFontOfSize:16.0];
}

- (void)setupAvatar
{
    [self.userAvatarImage setImageWithURL:[NSURL URLWithString:[self.headerObject getImageURL]]
                         placeholderImage:[UIImage imageNamed:@"fb_blank_profile_square"]
                                  options:nil
                                  success:^(UIImage *image, BOOL cached) {
                                      if (image) {
                                          [_userAvatarImage setImage:image];
                                      }
                                      
                                  } failure:^(NSError *error) {
                                      NSLog(@"error description %@", [error description]);
                                  }];
}

- (void)dealloc {
    [self.userNameLabel release];
    [super dealloc];
}

@end
