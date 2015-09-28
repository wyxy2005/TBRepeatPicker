//
//  TBRPHelper.swift
//  TBRepeatPicker
//
//  Created by hongxin on 15/9/28.
//  Copyright © 2015年 Teambition. All rights reserved.
//

import UIKit

let TBRPScreenWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
let TBRPScreenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height

class TBRPHelper {
    class func weekdays(locale: NSLocale) -> [String] {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = locale
        return dateFormatter.weekdaySymbols
    }
    
    class func yearMonths(locale: NSLocale) -> [String] {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = locale
        return dateFormatter.monthSymbols
    }
    
    class func frequencies(locale: NSLocale) -> [String] {
        return ["每天", "每周", "每月", "每年"]
    }
    
    class func units(locale: NSLocale) -> [String] {
        return ["天", "周", "月", "年"]
    }
    
    class func pluralUnits(locale: NSLocale) -> [String] {
        return ["天s", "周s", "月s", "年s"]
    }
    
    class func presetRepeat(locale: NSLocale) -> [String] {
        return ["永不", "每天", "每周", "每两周", "每月", "每年"]
    }
    
    class func daysInWeekPicker(locale: NSLocale) -> [String] {
        return ["星期日", "星期一", "星期二", "星期三", "星期四","星期五", "星期六", "自然日", "工作日", "周末"]
    }
    
    class func sequencesInWeekPicker(locale: NSLocale) -> [String] {
        return ["第一个", "第二个", "第三个", "第四个", "第五个", "最后一个"]
    }
    
}
