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
{
    NSString *bundlePath;
}

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *userNameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *userAvatarImage;

@property (retain, nonatomic) IBOutlet UIButton *button;

@end

@implementation MWUserHeaderView

+ (id)newWithPhoto:(id<MWPhoto>)photo {
    
    NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"MWPhotoBrowser" ofType:@"bundle"];
    
    NSArray *arr = [[NSBundle bundleWithPath:bundlePath] loadNibNamed:@"MWUserHeaderView"
                                                                owner:nil
                                                              options:nil];
    MWUserHeaderView *header = [arr lastObject] ;
    return [header retain];
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
    UIImage *buttonBackground = [UIImage imageWithContentsOfFile:[[NSBundle bundleWithPath:bundlePath] pathForResource:@"navbarBG" ofType:@"png"]];
    [self.button setBackgroundImage:buttonBackground forState:UIControlStateNormal];
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
