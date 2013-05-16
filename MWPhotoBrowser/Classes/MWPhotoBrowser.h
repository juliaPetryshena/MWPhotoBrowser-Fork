//
//  MWPhotoBrowser.h
//  MWPhotoBrowser
//
//  Created by Michael Waterfall on 14/10/2010.
//  Copyright 2010 d3i. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "MWPhoto.h"
#import "MWPhotoProtocol.h"
#import "MWCaptionView.h"
#import "MWUserHeaderView.h"

typedef void (^FacebookShareBlock)(UIImage*image);
typedef void (^MailShareBlock)(UIImage*image);

// Debug Logging
#if 0 // Set to 1 to enable debug logging
#define MWLog(x, ...) NSLog(x, ## __VA_ARGS__);
#else
#define MWLog(x, ...)
#endif

// Delgate
@class MWPhotoBrowser;
@protocol MWPhotoBrowserDelegate <NSObject>
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser;
- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index;
- (void)didSelectHeaderObject:(id)object;
@optional
- (MWUserHeaderView *)photoBrowser:(MWPhotoBrowser *)photoBrowser captionViewForPhotoAtIndex:(NSUInteger)index;
- (void) destructiveButtonActionSheet:(NSInteger)imageindex;
@end

// MWPhotoBrowser
@interface MWPhotoBrowser : UIViewController <UIScrollViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

// Properties
@property (nonatomic) BOOL displayActionButton;
@property (nonatomic) BOOL isNeedToResetNavbarAppearance;
@property (nonatomic) float slideshowInterval;
@property (nonatomic) BOOL isPosibleToRemovePhotos;
@property (nonatomic, copy) FacebookShareBlock facebookShareBlock;
@property (nonatomic, copy) MailShareBlock mailShareBlock;

@property (nonatomic, strong) UIBarButtonItem *actionButton;
@property (nonatomic, strong) UIBarButtonItem *startButton;
@property (nonatomic, strong) UIBarButtonItem *stopButton;
@property (nonatomic, strong) UIBarButtonItem *previousViewControllerBackButton;
@property (nonatomic, strong) UIView *viewForNavigationBar;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic) BOOL isNeedToSetStandartBackButton;
@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic) NSInteger totalNumberOfPhotos;
// Init
- (id)initWithPhotos:(NSArray *)photosArray  __attribute__((deprecated)); // Depreciated
- (id)initWithDelegate:(id <MWPhotoBrowserDelegate>)delegate;

// Reloads the photo browser and refetches data
- (void)reloadData;

// Set page that photo browser starts on
- (void)setInitialPageIndex:(NSUInteger)index;

- (void)startSlideShow;
- (void)stopSlideShow;

@end


