//
//  ReserveDataPick.swift
//  OnlineReservation
//
//  Created by Roy on 2019/6/9.
//  Copyright © 2019 citi. All rights reserved.
//

import UIKit

class ReserveDataPick: UIDatePicker {


    override func draw(_ rect: CGRect) {

        //设置picker格式
//        self.backgroundColor = UIColor.white
        self.datePickerMode = .dateAndTime
        //选取时间间隔 以15分钟为一个时间间隔
        self.minuteInterval = 15
        //设置预设时间为现在时间
//        self.date = Date()
        //设置date的格式
        let formatter = DateFormatter()
        //设置展示的时间格式
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let startdate = NSDate().addingTimeInterval(600)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        var strNowTime = timeFormatter.string(from: startdate as Date) as String
        let fromDateTime = formatter.date(from: strNowTime)
        
        let enddate = NSDate().addingTimeInterval(86400)
        let endtimeFormatter = DateFormatter()
        endtimeFormatter.dateFormat = "yyyy-MM-dd 17:00"
        let endDateTimestr = endtimeFormatter.string(from: enddate as Date) as String
//        let index = strNowTime.index(strNowTime.startIndex, offsetBy:10)//获取字符d的索引
//        var endTime = strNowTime.substring(to: index)
//        endTime = endTime + " 17:00"
//        print(endDateTime)
        let endDateTime = formatter.date(from: endDateTimestr)
        
        //可以选择的最早日期时间
        //myDatePicker.miniumDate = fromDateTime
        self.minimumDate = fromDateTime
        //可以选择最晚的时间日期
        
        self.maximumDate = endDateTime
        //设置语言
        self.locale = Locale(identifier: "zh_CN")
        //选择时间 执行的动作
        self.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        //设置中心点
        //self.center = CGPoint(x: frame.width * 0.5, y: frame.height * 0.5)
    }
    @objc private func datePickerChanged(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        print(formatter.string(from: datePicker.date))
    }
}
