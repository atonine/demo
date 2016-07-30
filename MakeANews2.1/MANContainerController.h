//
//  MANContainerController.h
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/27.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "ViewController.h"

@interface MANContainerController : UIViewController
@property(strong,nonatomic)UIViewController*parentController;

@property(strong,nonatomic)UIColor*navigationBarBackgroundColor;


+(instancetype)containerControllerWithSubControllers:(NSArray<UIViewController*>*)viewControllers parentController:(UIViewController*)vc;

@end
