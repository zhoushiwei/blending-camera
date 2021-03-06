//
//  ViewController.h
//  distortionCamera
//
//  Created by 武田 祐一 on 2012/12/17.
//  Copyright (c) 2012年 武田 祐一. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <GLKit/GLKit.h>
#import "DistPreviewView.h"
#import "DistControllToolBar.h"
#import "DistFilterSelectionViewController.h"


@class CIDetector;

@interface FaceViewController : UIViewController
<AVCaptureVideoDataOutputSampleBufferDelegate,
DistControllToolBarDelegate,
DistDistFilterSelectionDelegate
>
{
    //dispatch_queue_t _videoDataOutputQueue;
}

@property (weak, atomic) IBOutlet DistPreviewView *previewView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;


@end

