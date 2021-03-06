//
//  UIImagePickerController+Edit.m
//  Sample
//
//  Created by Ignacio on 1/2/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//

#import "UIImagePickerController+Edit.h"
#import "DZNPhotoPickerController.h"

static DZNPhotoEditViewControllerCropMode _editingMode;

@implementation UIImagePickerController (Edit)

- (void)setEditingMode:(DZNPhotoEditViewControllerCropMode)mode
{
    _editingMode = mode;
    
    switch (mode) {
        case DZNPhotoEditViewControllerCropModeSquare:
            self.allowsEditing = YES;
            break;
            
        case DZNPhotoEditViewControllerCropModeCircular:
        case DZNPhotoEditViewControllerCropModeCustom:
            self.allowsEditing = NO;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPickImage:) name:kDZNPhotoPickerDidFinishPickingNotification object:nil];
            break;
            
        default:
            self.allowsEditing = NO;
            [[NSNotificationCenter defaultCenter] removeObserver:self name:kDZNPhotoPickerDidFinishPickingNotification object:nil];
            break;
    }
}

- (DZNPhotoEditViewControllerCropMode)editingMode
{
    return _editingMode;
}

- (void)didPickImage:(NSNotification *)notification
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imagePickerController:didFinishPickingMediaWithInfo:)]){
        self.editingMode = DZNPhotoEditViewControllerCropNone;
        [self.delegate imagePickerController:self didFinishPickingMediaWithInfo:notification.userInfo];
    }
}

@end
