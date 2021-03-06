//
//  WeiboModel.m
//  WXWeibo
//
//  Created by Jays owen on 13-8-1.
//  Copyright (c) 2013年 Jays owen. All rights reserved.
//

#import "WeiboModel.h"
#import "UserModel.h"
@implementation WeiboModel

- (NSDictionary *) attributeMapDictionary
{
    NSDictionary *mapAtt = @{
                             @"createDate":@"created_at",
                             @"weiboId":@"id",
                             @"text":@"text",
                             @"source":@"source",
                             @"favorited":@"favorited",
                             @"thumbnailImage":@"thumbnail_pic",
                             @"bmiddleImage":@"bmiddle_pic",
                             @"originalImage":@"original_pic",
                             @"geo":@"geo",
                             @"repostsCount":@"reposts_count",
                             @"commentsCount":@"comments_count"
                             };
    
    return mapAtt;
}

- (void)setAttributes:(NSDictionary *)dataDic
{
    //将字典数据根据映射广西填充到当前对象的属性上
    [super setAttributes:dataDic];
    
    NSDictionary *retweetDic = [dataDic objectForKey:@"retweeted_status"];
    if (retweetDic != nil) {
    WeiboModel *relWeibo = [[WeiboModel alloc] initWithDataDic:retweetDic];
    self.relWeibo = relWeibo;
    [relWeibo release];
    }
    NSDictionary *userDic = [dataDic objectForKey: @"user"];
    if (dataDic != nil) {
    UserModel *user = [[UserModel alloc] initWithDataDic:userDic];
    self.user = user;
    [user release];
    }
    
}


@end


