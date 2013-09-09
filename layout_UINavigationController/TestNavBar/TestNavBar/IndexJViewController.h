//
//  ViewController.h
//  TestNavBar
//
//  Created by Albert Chu on 13-8-30.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIPlaceHolderTextField, UIPlaceHolderTextView;

@interface IndexJViewController : UIViewController <UITextFieldDelegate>


@property (strong, nonatomic) UIPlaceHolderTextField    *testTextField;

@property (strong, nonatomic) UIPlaceHolderTextView     *testTextView;


@property (strong, nonatomic) UILabel                   *testLabel;

@property (strong, nonatomic) UIButton                  *testButton;

@property (strong, nonatomic) UIImageView               *testImageView;


@end
