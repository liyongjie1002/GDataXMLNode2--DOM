 //
//  ViewController.m
//  WallPaper
//
//  Created by liyongjie on 2017/7/5.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+WebCache.h>
#import "XMLTool.h"
@interface ViewController ()

@property (nonatomic,strong)NSMutableArray *wallArr;
@property (nonatomic,copy)NSString *baseUrl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self requestData];
    [self setUI];
}
#pragma mark 初始化数据
-(void)requestData{
    XMLTool *xmlTool = [[XMLTool alloc]init];
    xmlTool.dataBlock = ^(NSMutableArray *arr,NSString *str) {
        _wallArr = arr;
        _baseUrl = str;
    };
    
    [xmlTool parse];
    
}
#pragma mark 添加一张图片
-(void)setUI{

    
    NSInteger num = arc4random()%_wallArr.count;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height - 60)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_baseUrl,[_wallArr[num] valueForKey:@"thumblink"]]]];
    [self.view addSubview:imageView];
}





@end
