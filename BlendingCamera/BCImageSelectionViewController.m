//
//  BCImageSelectionViewController.m
//  BlendingCamera
//
//  Created by 武田 祐一 on 2012/09/21.
//  Copyright (c) 2012年 武田 祐一. All rights reserved.
//

#import "BCImageSelectionViewController.h"

#import "BCBlenderRapper.h"

@interface BCImageSelectionViewController ()
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;
@end

@implementation BCImageSelectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_baseImageView.contentMode = UIViewContentModeScaleAspectFit;
	self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	_indicatorView.frame = CGRectMake(0, 0, 100, 100);
	_indicatorView.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
	_indicatorView.hidesWhenStopped = YES;
	[self.view addSubview:_indicatorView];
}

- (void)viewDidUnload
{
    [self setProcessingButton:nil];
    [self setMixtureSwitch:nil];
	[self setIndicatorView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




#pragma mark - ===========image loaders============== -
#pragma mark load base image

- (IBAction)loadBaseImage:(id)sender { [self showActionSheetWithTag:0]; }

- (void)loadBaseImageFromPicker:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = sourceType;
    [self presentModalViewController:imagePicker animated:YES];
}

#pragma mark load parts image

- (IBAction)loadPartsImage:(id)sender { [self showActionSheetWithTag:1]; }

- (void)showPartsImagePickerWithType:(UIImagePickerControllerSourceType)type
{
	BCPartsPickerController *partsPicker = [[BCPartsPickerController alloc] initWithPickerType:type];
	partsPicker.delegate = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:partsPicker];
    navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	[self presentModalViewController:navigationController animated:YES];
}

#pragma mark - ============ Delegates ============ -
#pragma mark UIActionSheet Creator and Delegates
- (void)showActionSheetWithTag:(NSInteger)tag
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"load from Library", @"take a photo", nil];
    actionSheet.tag = tag;
    [actionSheet showInView:self.view.window];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerControllerSourceType sourceType;
    if (buttonIndex == 0) sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    else if (buttonIndex == 1) sourceType = UIImagePickerControllerSourceTypeCamera;
    else return;
    
    if (actionSheet.tag == 0) [self loadBaseImageFromPicker:sourceType];
    else if (actionSheet.tag == 1) [self showPartsImagePickerWithType:sourceType];
}


#pragma -- mark image picker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	UIImage *loadedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
	[self dismissModalViewControllerAnimated:YES];
	self.baseImage = loadedImage;
    self.baseImageView.image = _baseImage;
    _processingButton.enabled = _baseImage && _partsImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissModalViewControllerAnimated:YES];
}


#pragma -- mark parts picker delegate
- (void)BCPartsPickerControllerPickDone:(BCPartsPickerController *)partsPicker partsImage:(UIImage *)image andMask:(UIImage *)mask
{
	[self dismissModalViewControllerAnimated:YES];
	
    self.partsImage = image;
    self.maskImage  = mask;
    self.partsImageView = [[BCPartsView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    _partsImageView.image = image;
    [self.view insertSubview:_partsImageView aboveSubview:_baseImageView];
    
    _processingButton.enabled = _baseImage && _partsImage;
    
}

- (void)BCPartsPickerControllerCanceld:(BCPartsPickerController *)partsPicker
{
	[self dismissModalViewControllerAnimated:YES];
}

#pragma - mark start processing
- (IBAction)startProcessing:(id)sender
{
	if (!_baseImage || !_partsImage || !_maskImage) return;
	
    BOOL mixture = self.mixtureSwitch.selected;
	_processingButton.enabled = NO;
	[_indicatorView startAnimating];
    dispatch_queue_t queue = dispatch_queue_create("TKDIndustry.bc.blend", NULL);
    dispatch_async(queue, ^{

        CGSize imgSize2x = CGSizeMake(_partsImageView.frame.size.width * 2.0, _partsImageView.frame.size.height * 2.0);
        BCBlenderRapper *blender = [[BCBlenderRapper alloc] init];
        blender.sourceImage = [BCPartsView resizedImage:_partsImage ForSize:imgSize2x];
        blender.targetImage = [self resizeBaseImageForBlend];
        blender.mask        = [BCPartsView resizedGrayScaleImage:_maskImage ForSize:imgSize2x];
        blender.offset      = [self maskOffset];

        NSLog(@"%@", NSStringFromCGSize(blender.sourceImage.size));
        NSLog(@"%@", NSStringFromCGSize(blender.targetImage.size));
        NSLog(@"%@", NSStringFromCGSize(blender.mask.size));
        NSLog(@"%@", NSStringFromCGPoint(blender.offset));

        UIImage *dst = [blender WrappedSeamlessClone:(bool)mixture];

        [self blendingFinished:dst];
        
    });
    
}

- (UIImage *)resizeBaseImageForBlend
{
    CGSize imgSize = _baseImage.size;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    screenSize.height *= 2.0;
    screenSize.width  *= 2.0;
    CGSize convertSize;
    if (imgSize.width > imgSize.height) { // 横長の場合
        convertSize.width = screenSize.width;
        convertSize.height = imgSize.height * screenSize.width / imgSize.width;
    } else { // 縦長の場合
        convertSize.height = screenSize.height;
        convertSize.width = imgSize.width * screenSize.height / imgSize.height;
    }
    return [BCPartsView resizedImage:_baseImage ForSize:convertSize];
}

- (CGPoint)maskOffset
{
	CGPoint imgOrigin;
	CGSize imgSize = _baseImage.size;

	if (imgSize.width > imgSize.height) { // 横長の場合
		CGFloat imgHeightInView = imgSize.height * _baseImageView.frame.size.width / imgSize.width;
		imgOrigin.x = 0;
		imgOrigin.y = (_baseImageView.frame.size.height - imgHeightInView) / 2.0;
	} else { // 縦長の場合
		CGFloat imgWidthInView = imgSize.width * _baseImageView.frame.size.height / imgSize.height;
		imgOrigin.x = (_baseImageView.frame.size.width - imgWidthInView) / 2.0;
		imgOrigin.y = 0;
	}

    CGPoint maskOrigin = _partsImageView.frame.origin;
	NSLog(@"mask origin ; %@", NSStringFromCGPoint(maskOrigin));
    return CGPointMake((maskOrigin.x - imgOrigin.x) * 2.0, (maskOrigin.y - imgOrigin.y) * 2.0);
}


- (void)blendingFinished:(UIImage *)blendImage;
{
	dispatch_async(dispatch_get_main_queue(), ^{
		_processingButton.enabled = YES;
		[_indicatorView stopAnimating];
		NSLog(@"blending finished");
		[self.partsImageView removeFromSuperview];
		self.partsImage = nil;
		self.maskImage  = nil;
		self.baseImage  = blendImage;
		self.baseImageView.image = blendImage;
		self.partsImageView = nil;
		self.processingButton.enabled = NO;
		UIImageWriteToSavedPhotosAlbum(blendImage, nil, nil, nil);
	});
}

@end
