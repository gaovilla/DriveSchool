//
//  AFNetworkKit.m
//  puke
//
//  Created by woo akpaul on 14-6-9.
//  Copyright (c) 2014年 Bitbao. All rights reserved.
//

#import "AFNetworkKit.h"
#import "env_dev.h"
@implementation AFNetworkKit

//单例AFHTTPSessionManager
+ (instancetype)sharedClient {
    static AFNetworkKit *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFNetworkKit alloc] initWithBaseURL:[NSURL URLWithString:kAPI_BASE_URL]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
    });
    
    [_sharedClient.requestSerializer setValue:[AppUtil getAppVersionInfo] forHTTPHeaderField:@"app-version"];
    NSString * token = [[NSUserDefaults standardUserDefaults] stringForKey:kAPP_LOCALDATA_USERTOKEN];
    if (token) {
        [_sharedClient.requestSerializer setValue:token forHTTPHeaderField:@"x-yd-token"];
    }

    return _sharedClient;
}

//单例AFHTTPSessionManager
+ (instancetype)sharedClient_two {
    static AFNetworkKit *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFNetworkKit alloc] initWithBaseURL:[NSURL URLWithString:kAPI_BASE_TWO_URL]];
        
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        NSString * token = [[NSUserDefaults standardUserDefaults] stringForKey:kAPP_LOCALDATA_USERTOKEN];
        if (token) {
            [_sharedClient.requestSerializer setValue:token forHTTPHeaderField:@"x-yd-token"];
        }
        
    });
    
    return _sharedClient;
}

+ (instancetype)sharedClient_wx{
    
    static AFNetworkKit *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFNetworkKit alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.weixin.qq.com"]];
        
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        
    });
    
    return _sharedClient;
}


+ (NSString *) getMessageWithResponse:(NSURLResponse *)response Error:(NSError * )error{
    NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse*)response;
    NSInteger statusCode = [httpResponse statusCode];
    return [NSString stringWithFormat:@"网络请求异常，请稍后再试(%d,%@)", statusCode, [error localizedDescription]];
}

    




@end
