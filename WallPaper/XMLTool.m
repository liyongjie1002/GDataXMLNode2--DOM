//
//  XMLTool.m
//  WallPaper
//
//  Created by liyongjie on 2017/7/5.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import "XMLTool.h"


@implementation XMLTool



//外部调用接口
-(void)parse{

    _modelArr  = [NSMutableArray array];

    
    NSString *xmlFilePath = [[NSBundle mainBundle]pathForResource:@"test" ofType:@".xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    NSError *error = nil;
    
    
    _xmlDocument = [[GDataXMLDocument alloc]initWithData:xmlData options:0 error:&error];
    if (error) {
        NSLog(@"%@",error);
        return;
    }
    //  取根节点
    GDataXMLElement *rootElement = [_xmlDocument rootElement];
    //获取根节点下所有的子节点
    
    
    
    NSArray *elementArr = rootElement.children;
    
    NSString *baseUrl  = [[rootElement attributeForName:@"baseurl"]stringValue];
    
    for (int i=0; i<elementArr.count; i++) {
        GDataXMLElement *img = [elementArr objectAtIndex:i];
 
        NSString *thumblink = [[img attributeForName:@"thumblink"] stringValue];
        NSString *link = [[img attributeForName:@"link"] stringValue];
        NSString *downnum = [[img attributeForName:@"downnum"]stringValue];
        NSString *id = [[img attributeForName:@"id"]stringValue];
        NSString *author = [[img attributeForName:@"author"]stringValue];
        NSString *uploader = [[img attributeForName:@"uploader"]stringValue];
 
        _model = [[WallPaperModel alloc]init];
        [_model setValue:thumblink forKey:@"thumblink"];
        [_model setValue:link forKey:@"link"];
        [_model setValue:downnum forKey:@"downnum"];
        [_model setValue:id forKey:@"id"];
        [_model setValue:author forKey:@"author"];
        [_model setValue:uploader forKey:@"uploader"];
    
    
        [_modelArr addObject:_model];
    }
    
    
    
    
    if (_dataBlock) {
        
        _dataBlock(_modelArr,baseUrl);

    }
    
}

@end
