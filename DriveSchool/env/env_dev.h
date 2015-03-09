//
//  env_dev.h
//  puke
//
//  Created by Bitbao on 14-6-11.
//  Copyright (c) 2014年 Bitbao. All rights reserved.
//

#ifndef puke_env_dev_h
#define puke_env_dev_h


//##API 地址配置
//static NSString * const kAPI_BASE_URL = @"http://10.32.0.58:8888";


//开发联调地址
//static NSString * const kAPI_BASE_URL = @"http://10.63.255.22:8080";
//测试地址
//static NSString * const kAPI_BASE_URL = @"http://localhost:8081/driving-school-test/servlet";

static NSString * const kAPI_BASE_URL = @"http://localhost:8080";

//企业版生产地址
//static NSString * const kAPI_BASE_URL = @"http://apibak.yundong.runnerbar.com";
//appstore版生产地址
//static NSString * const kAPI_BASE_URL = @"http://api.yundong.runnerbar.com";

//推送消息地址

//##API 地址配置
//static NSString * const kAPI_BASE_TWO_URL = @"http://10.32.0.58:8888";
//开发联调地址
//static NSString * const kAPI_BASE_TWO_URL = @"http://10.63.255.22:9080";
//测试地址
static NSString * const kAPI_BASE_TWO_URL = @"http://xg.pk.bitbao.net";
//企业版生产地址
//static NSString * const kAPI_BASE_TWO_URL = @"http://pushbak.yundong.runnerbar.com";
//appstore版生产地址
//static NSString * const kAPI_BASE_TWO_URL = @"http://push.yundong.runnerbar.com";

//新版本API
static  NSString * kAPP_VERSION_INFO = @"Fir.im 内测版";
//用户反馈
static NSString * const kAPI_TEST_LOGIN = @"/driving-school-web/app/login";

static NSString * const kAPI_ACTIVITY_GETDETAIL = @"/yundong/yd_info/getActivityDetail.json";

#endif
