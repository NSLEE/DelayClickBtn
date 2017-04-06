//
//  ViewController.m
//  DelayClickBtn
//
//  Created by KOLee on 2017/4/6.
//  Copyright © 2017年 KOLee. All rights reserved.
//

#import "ViewController.h"

#import "UIControl+KOBtnClickDelay.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *normolBtn;

@property (weak, nonatomic) IBOutlet UIButton *delayBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.normolBtn addTarget:self
                       action:@selector(clickNormolBtn)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.delayBtn addTarget:self
                      action:@selector(clickDelayBtn)
            forControlEvents:UIControlEventTouchUpInside];
    self.delayBtn.KO_Interval = 1.0;
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)clickNormolBtn{
    NSLog(@"正常点击");
}

- (void)clickDelayBtn{
    NSLog(@"延迟点击");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
