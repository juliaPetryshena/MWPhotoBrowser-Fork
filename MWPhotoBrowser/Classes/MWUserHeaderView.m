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


@property (unsafe_unretained, nonatomic)  UILabel *userNameLabel;
@property (unsafe_unretained, nonatomic)  UIImageView *userAvatarImage;


@end

@implementation MWUserHeaderView

- (id)init {
    
    self = [super init];
    if (self) {
        [self createHeader];
        return [header retain];
    }
    return self;
}

- (void)createHeader
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = headerView.frame;
    [button addTarget:self action:@selector(userHeaderDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setTintColor:[UIColor colorWithRed:240./255 green:54./255 blue:140./255 alpha:1]];
    
    self.userAvatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(6, 7, 34, 31)];
    
    self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(53, 12, 258, 21)];
    
    [headerView addSubview:button];
    [headerView addSubview:avatarImage];
    [headerView addSubview:usernameLabel];
    
    [self.view addSubview:headerView];
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
    
    [_button release];
    [super dealloc];
}

@end
