//
//  ViewController.m
//  React_Objc_1
//
//  Created by Pavel Samsonov on 25/02/2018.
//  Copyright © 2018 MegaLabs. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.firstNameTextField, backgroundColor) = [[[self.firstNameTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @(value.length > 5);
    }] distinctUntilChanged] map:^id _Nullable(id  _Nullable value) {
        
        NSLog(@"123");
        if ([value boolValue]) {
            return [UIColor orangeColor];
        } else {
            return [UIColor whiteColor];
        }
    }];
    
//    NSLog(@"%s", __FUNCTION__); read about
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
