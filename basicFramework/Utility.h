//
//  Utility.h
//  createUi
//
//  Created by jefactoria on 16/11/24.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/sysctl.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <SystemConfiguration/CaptiveNetwork.h>
@interface Utility : NSObject
+ (NSString *)md5big:(NSString*)input;
+ (NSString *)md5small:(NSString*)input;

//检测网络
+ (BOOL)checkNetWorkAvailable;

//网络失败样式
+ (void)asiRequestFail:(UIView *)view;

//获取本地版本号
+(NSString*) getLocalAppVersion;

//获取BundleID
+(NSString*) getBundleID;

//获取app的名字
+(NSString*) getAppName;

//16进制颜色改为UIcolor
+(UIColor *)getColor:(NSString *) hexColor;

/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile;

//判断字符串是否为空
+(BOOL) isBlankString:(NSString *)string;

//字典转json
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

//生成guid
+ (NSString *)getUniqueStrByUUID;

//反序列化
+(NSDictionary *)jsonDictionarBystring:(NSString *)message;

//压缩图片到指定尺寸大小
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

//压缩图片到指定文件大小
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

//判断是否有空格
+ (BOOL)isHaveSpaceInString:(NSString *)string;

//判断是否有中文
+ (BOOL)isHaveChineseInString:(NSString *)string;

//判断字符串是否全部为数字
+ (BOOL)isAllNum:(NSString *)string;

//获取当前的viewcontroller
+ (UIViewController *)getCurrentVC;


//对图片进行模糊处理
+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius;


//对图片进行滤镜处理
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;

//获取当前时间
//format: @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"
+ (NSString *)currentDateWithFormat:(NSString *)format;

//计算上次日期距离现在多久
+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime

                        lastTimeFormat:(NSString *)format1

                         ToCurrentTime:(NSString *)currentTime

                     currentTimeFormat:(NSString *)format2;

//获取文件大小
+ (long long)fileSizeAtPath:(NSString *)filePath;

//根据日期算出周几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;

//获取电池电量(一般用百分数表示,大家自行处理就好)
+ (CGFloat)getBatteryQuantity;

//获取电池状态(UIDeviceBatteryState为枚举类型)
+ (UIDeviceBatteryState)getBatteryStauts;

//获取总内存大小
+ (long long)getTotalMemorySize;


//型号
+ (NSString *)getCurrentDeviceModel:(UIViewController *)controller;

//IP地址
//#import <ifaddrs.h>和#import <arpa/inet.h>
+ (NSString *)deviceIPAdress;

//当前手机连接的WIFI名称(SSID)
//需要#import <SystemConfiguration/CaptiveNetwork.h>

+ (NSString *)getWifiName;
@end
