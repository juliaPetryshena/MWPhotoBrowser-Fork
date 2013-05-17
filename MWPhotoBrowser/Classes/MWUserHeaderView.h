//
//  MWUserHeaderViewController.h
//  MWPhotoBrowser
//
//  Created by Yulia Petryshena on 5/13/13.
//
//

#import <UIKit/UIKit.h>
#import "MWCaptionView.h"
#import "MWHeaderObject.h"

@protocol MWUserHeaderViewDelegate <NSObject>

- (void)didSelectHeaderObject:(id)object;

@end

@interface MWUserHeaderView : MWCaptionView

@property (nonatomic, strong) id <MWHeaderObject> headerObject;
@property (nonatomic, unsafe_unretained) id <MWUserHeaderViewDelegate> delegate;

@property (unsafe_unretained, nonatomic)  UILabel *userNameLabel;
@property (unsafe_unretained, nonatomic)  UIImageView *userAvatarImage;
@property (unsafe_unretained, nonatomic)  UIButton *button;


- (void)setup;

@end
