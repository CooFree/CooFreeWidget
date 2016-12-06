//
//  ViewController.m
//  CooFreeWidget
//
//  Created by yssj on 2016/12/5.
//  Copyright © 2016年 CooFree. All rights reserved.
//

#import "ViewController.h"
#define DRandomColor    [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:arc4random_uniform(255)/255.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    UIImageView *Img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    Img.center = self.view.center;
    Img.backgroundColor=DRandomColor;
    NSString *str= [[NSUserDefaults standardUserDefaults]objectForKey:@"img"];
    Img.image=[UIImage imageNamed:str];
    [self.view addSubview:Img];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
