//
//  CommonMacro.h
//  DoctorEasyMedical
//
//  Created by 冯万琦 on 16/5/27.
//  Copyright © 2016年 sss. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

// App info
#define AppBundleId [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define AppVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define AppBuildVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

/**
 *  云信
 */
#if TestMode
#define NRTCAppKey @"4c418f22935f1e2cf8488ff1c84229c0"
#else
#define NRTCAppKey @"4c418f22935f1e2cf8488ff1c84229c0"
#endif
/**
 *  过期提醒
 */
#define Deprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)
/**
* 通知宏
 */
#define ReloadOrderListNF @"ReloadOrderListNF"
#define ReloadReceiveListNF @"ReloadReceiveListNF"
/**
*系统版本宏定义
*/
#define isBeta (BETA==1)
#define isDistribution (ONLINE==1)

/*
 *打印NSLog

 */
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#define LRToast(str) [NSString stringWithFormat:@"%@",@#str]
#else
#   define DLog(...)
#   define ELog(err)
#define LRToast(str)

#endif
/**
 *  字符串去除前后引号
 */
#define Trim(arg) [arg stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

/**
 *  字符串转URL
 */
#define UrlWithString(arg) [NSURL URLWithString:arg]

/**
 *  快速ImageView
 */
#define ImageWithName(arg) [UIImage imageNamed:arg]

/**
 *  placeholder
 */
#define PlaceholderImg [UIImage imageNamed:@"placeholder"]
/**
 *  blank
 */
#define BlankImg [UIImage imageNamed:@"blank"]
/**
 *  Appdelegate 获取
 */
#define APP_DELEGATE ((AppDelegate *)([UIApplication sharedApplication].delegate))

/*
 *颜色，自定宏定义
 */
#define RGBA(r,g,b,a)               [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define RGB(r,g,b)                  [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1.0f]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define FONT(f)                     [UIFont systemFontOfSize:f]

/*
 * block中self的引用，防止循环引用
 */
#define weakify(VAR) \
ext_keywordify \
__weak __typeof(&*VAR) __weak##VAR = VAR;
#define strongify(VAR) \
ext_keywordify \
__strong __typeof(&*VAR) VAR = __weak##VAR;

#pragma mark - 弱引用self
#if DEBUG
#define ext_keywordify autoreleasepool {}
#else
#define ext_keywordify try {} @catch (...) {}
#endif
/*
 * 获取app的版本号
 */
#define kSoftwareVersion    ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]) //获取app的版本号



/*
 * 10像素高(宽)度
 
 */
#define kTopMarginHeight 10

/**
 *  颜色
 */
#define Kblue [UIColor colorWithRed:0/255.0 green:159/255.0 blue:232/255.0 alpha:1]
#define kgray [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1]
#define Kred [UIColor colorWithRed:231/255.0 green:68/255.0 blue:80/255.0 alpha:1]
#define Kwhite [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
#define Kblack [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]
#define KFontGray [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1]
/*
 *@bref  系统版本判断
 */
#define iOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 *  每页请求数量
 */
#define PageSize 10

/**
 *  常量宏定义
 */
#define kJustWating      @"请稍后..."
#define kNetworkError    @"网络异常，请稍后重试"

/**
 *  友盟推送key
 */

#define kUmengMessage @"57511cf9e0f55a4c7f0022a0"
#define UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

/**
 *  百度地图key
 */

#define kMapKey @"V5y5IfkUWUyrNdI3kiluH3bXxxSnWhql"

/**
 *  手机系统版本
 */

#define _IPHONE80_ 80000
/**
 *  病例图片字典对象字段名称
 */
static NSString *const Case_ImageDict_ThumbImg = @"imgThumbnail";
static NSString *const Case_ImageDict_Img = @"img";


#endif /* CommonMacro_h */
