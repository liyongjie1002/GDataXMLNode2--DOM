//
//  XMLTool.h
//  WallPaper
//
//  Created by liyongjie on 2017/7/5.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WallPaperModel.h"
#import <GDataXMLNode.h>


typedef void(^DataBlock)(NSMutableArray *arr,NSString *str);


@interface XMLTool : NSObject<NSXMLParserDelegate>

@property (nonatomic,strong)GDataXMLDocument *xmlDocument;
@property (nonatomic,strong)WallPaperModel *model;
@property (nonatomic,strong)NSMutableArray *modelArr;

@property (nonatomic,copy)DataBlock dataBlock;

//声明parse方法，通过它实现解析
-(void)parse;


@end
