//
//  Utility.m
//  createUi
//
//  Created by jefactoria on 16/11/24.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import "Utility.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Add.h"
#import "Reachability.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation Utility
//MD5 小写加密
+ (NSString *)md5big:(NSString*)input
{
    const char *cStr = [input UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


// MD5 大写加密
+ (NSString *)md5small:(NSString*)input
{
    const char *cStr = [input UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


//网络异常情况样式
+ (void)asiRequestFail:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = @"网络异常, 请重试";
    //设置样式
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

+(BOOL)checkNetWorkAvailable{
    BOOL result = [self isNetWorkAvailable];
    if(!result){
        [MBProgressHUD showError:@"当前网络不佳，请检查网络" toView:nil];
    }
    
    return result;
}

+(BOOL)isNetWorkAvailable{
    return [self isWIFIAvailable] || [self is3GAvailable];
}

// 是否wifi
+ (BOOL) isWIFIAvailable {
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}

// 是否3G
+ (BOOL) is3GAvailable {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
}

//获取本地版本号
+(NSString*) getLocalAppVersion

{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
}

//获取BundleID

+(NSString*) getBundleID

{
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    
}

//获取app的名字

+(NSString*) getAppName

{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

//16进制颜色改为UIcolor
+(UIColor *)getColor:(NSString *) hexColor{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:1.0f];
    
}

/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以1开头，9个 \d 数字字符^1[3|4|5|8] \d{9}$
    NSString *phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
//字典转json
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
//生成uuid
+ (NSString *)getUniqueStrByUUID
{
    CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    
    return uuidString;
    
}
//反序列化
+(NSDictionary *)jsonDictionarBystring:(NSString *)message{
    
    NSData *jsonData = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];;
    
    return dic;
}

//压缩图片到指定尺寸大小

+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    
    UIImage *resultImage = image;
    
    UIGraphicsBeginImageContext(size);
    
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIGraphicsEndImageContext();
    
    return resultImage;
    
}

//压缩图片到指定文件大小

+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    
    CGFloat dataKBytes = data.length/1000.0;
    
    CGFloat maxQuality = 0.9f;
    
    CGFloat lastData = dataKBytes;
    
    while (dataKBytes > size && maxQuality > 0.01f) {
        
        maxQuality = maxQuality - 0.01f;
        
        data = UIImageJPEGRepresentation(image, maxQuality);
        
        dataKBytes = data.length/1000.0;
        
        if (lastData == dataKBytes) {
            
            break;
            
        }else{
            
            lastData = dataKBytes;
            
        }
        
    }
    
    return data;
    
}

//判断是否有空格

+ (BOOL)isHaveSpaceInString:(NSString *)string{
    
    NSRange _range = [string rangeOfString:@" "];
    
    if (_range.location != NSNotFound) {
        
        return YES;
        
    }else {
        
        return NO;
        
    }
    
}

//判断是否有中文

+ (BOOL)isHaveChineseInString:(NSString *)string{
    
    for(NSInteger i = 0; i < [string length]; i++){
        
        int a = [string characterAtIndex:i];
        
        if (a > 0x4e00 && a < 0x9fff) {
            
            return YES;
            
        }
        
    }
    
    return NO;
    
}

//判断字符串是否全部为数字

+ (BOOL)isAllNum:(NSString *)string{
    
    unichar c;
    
    for (int i=0; i<string.length; i++) {
        
        c=[string characterAtIndex:i];
        
        if (!isdigit(c)) {
            
            return NO;
            
        }
        
    }
    
    return YES;
    
}

//获取当前的viewcontroller

+ (UIViewController *)getCurrentVC

{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    if (window.windowLevel != UIWindowLevelNormal)
        
    {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(UIWindow * tmpWin in windows)
            
        {
            
            if (tmpWin.windowLevel == UIWindowLevelNormal)
                
            {
                
                window = tmpWin;
                
                break;
                
            }
            
        }
        
    }
   
    UIView *frontView = [[window subviews] objectAtIndex:0];
    
    id nextResponder = [frontView nextResponder];
    
    
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        
        result = nextResponder;
    
    else
        
        result = window.rootViewController;
    
    
    
    return result;
    
}

#pragma mark - 对图片进行模糊处理

// CIGaussianBlur ---> 高斯模糊

// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)

// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)

// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)

// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)

+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius{
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    CIFilter *filter;
    
    if (name.length != 0) {
        
        filter = [CIFilter filterWithName:name];
        
        [filter setValue:inputImage forKey:kCIInputImageKey];
        
        if (![name isEqualToString:@"CIMedianFilter"]) {
            
            [filter setValue:@(radius) forKey:@"inputRadius"];
            
        }
        
        CIImage *result = [filter valueForKey:kCIOutputImageKey];
        
        CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
        
        UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
        
        CGImageRelease(cgImage);
        
        return resultImage;
        
    }else{
        
        return nil;
        
    }
    
}

#pragma mark - 对图片进行滤镜处理

// 怀旧 --> CIPhotoEffectInstant                         单色 --> CIPhotoEffectMono

// 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade

// 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess

// 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome

// CILinearToSRGBToneCurve, CISRGBToneCurveToLinear, CIGaussianBlur, CIBoxBlur, CIDiscBlur, CISepiaTone, CIDepthOfField

+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name{
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    CIFilter *filter = [CIFilter filterWithName:name];
    
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return resultImage;
    
}

//获取当前时间

//format: @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"

+ (NSString *)currentDateWithFormat:(NSString *)format{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:format];
    
    return [dateFormatter stringFromDate:[NSDate date]];
    
}

/**
 
 *  计算上次日期距离现在多久
 
 *
 
 *  @param lastTime    上次日期(需要和格式对应)
 
 *  @param format1     上次日期格式
 
 *  @param currentTime 最近日期(需要和格式对应)
 
 *  @param format2     最近日期格式
 
 *
 
 *  @return xx分钟前、xx小时前、xx天前
 
 */

+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime

                        lastTimeFormat:(NSString *)format1

                         ToCurrentTime:(NSString *)currentTime

                     currentTimeFormat:(NSString *)format2{
    
    //上次时间
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc]init];
    
    dateFormatter1.dateFormat = format1;
    
    NSDate *lastDate = [dateFormatter1 dateFromString:lastTime];
    
    //当前时间
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc]init];
    
    dateFormatter2.dateFormat = format2;
    
    NSDate *currentDate = [dateFormatter2 dateFromString:currentTime];
    
    return [Utility timeIntervalFromLastTime:lastDate ToCurrentTime:currentDate];
    
}


+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime{
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    
    //上次时间
    
    NSDate *lastDate = [lastTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:lastTime]];
    
    //当前时间
    
    NSDate *currentDate = [currentTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:currentTime]];
    
    //时间间隔
    
    NSInteger intevalTime = [currentDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    
    
    
    //秒、分、小时、天、月、年
    
    NSInteger minutes = intevalTime / 60;
    
    NSInteger hours = intevalTime / 60 / 60;
    
    NSInteger day = intevalTime / 60 / 60 / 24;
    
    NSInteger month = intevalTime / 60 / 60 / 24 / 30;
    
    NSInteger yers = intevalTime / 60 / 60 / 24 / 365;
    
    
    
    if (minutes <= 10) {
        
        return  @"刚刚";
        
    }else if (minutes < 60){
        
        return [NSString stringWithFormat: @"%ld分钟前",(long)minutes];
        
    }else if (hours < 24){
        
        return [NSString stringWithFormat: @"%ld小时前",(long)hours];
        
    }else if (day < 30){
        
        return [NSString stringWithFormat: @"%ld天前",(long)day];
        
    }else if (month < 12){
        
        NSDateFormatter * df =[[NSDateFormatter alloc]init];
        
        df.dateFormat = @"M月d日";
        
        NSString * time = [df stringFromDate:lastDate];
        
        return time;
        
    }else if (yers >= 1){
        
        NSDateFormatter * df =[[NSDateFormatter alloc]init];
        
        df.dateFormat = @"yyyy年M月d日";
        
        NSString * time = [df stringFromDate:lastDate];
        
        return time;
        
    }
    
    return @"";
    
}

//获取文件大小

+ (long long)fileSizeAtPath:(NSString *)filePath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:filePath]) return 0;
    
    return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
    
}

//根据日期算出周几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate
{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

//获取电池电量
+ (CGFloat)getBatteryQuantity
{
    return [[UIDevice currentDevice] batteryLevel];
}

//获取电池状态(UIDeviceBatteryState为枚举类型)
+ (UIDeviceBatteryState)getBatteryStauts
{
    return [UIDevice currentDevice].batteryState;
}

//获取总内存大小
+ (long long)getTotalMemorySize
{
    return [NSProcessInfo processInfo].physicalMemory;
}

//型号
+ (NSString *)getCurrentDeviceModel:(UIViewController *)controller
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4s (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

//ip地址
+ (NSString *)deviceIPAdress {
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    return address;
}
//当前手机连接的WIFI名称(SSID)
+ (NSString *)getWifiName
{
    NSString *wifiName = nil;
    
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return nil;
    }
    
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            
            CFRelease(dictRef);
        }
    }
    
    CFRelease(wifiInterfaces);
    return wifiName;
}
@end
