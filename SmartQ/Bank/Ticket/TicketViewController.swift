//
//  TicketViewController.swift
//  SmartQ
//
//  Created by 何大海 on 2019/6/10.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class TicketViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setNavigation(Title: "Your Ticket");
        
        view.backgroundColor = UIColor.init(red: 226.0/255, green: 227.0/255, blue: 228.0/255, alpha: 1.0)
        let confirmFrame = CGRect(x:view.frame.width/2 - 240/2, y:view.frame.height/2 - 450/2, width:240, height:450)
        let confirmView = TicketConfirmView(frame: confirmFrame)
        confirmView.backgroundColor  = UIColor.init(red: 226.0/255, green: 227.0/255, blue: 228.0/255, alpha: 1.0)
        let successBackImg = UIImageView(image:UIImage(named:"greenground"))
        successBackImg.frame = CGRect(x:confirmView.frame.width/2 - 150/2, y:240*0.4 - 130/2, width:150, height:130)
        let successFrontImg = UIImageView(image:UIImage(named:"confirmed"))
        successFrontImg.frame = CGRect(x:confirmView.frame.width/2 - 120/2, y:240*0.4 - 100/2, width:120, height:100)
        view.addSubview(confirmView)
        confirmView.addSubview(successBackImg)
        confirmView.addSubview(successFrontImg)
        let num = arc4random_uniform(100000)
        let label1 = UILabel(frame:CGRect(x:30, y:30 + 450 * 0.4 + 30, width:confirmView.frame.width - 60, height:30))
        let label2 = UILabel(frame:CGRect(x:30, y:60 + 450 * 0.4 + 30, width:confirmView.frame.width - 60, height:30))
        let label3 = UILabel(frame:CGRect(x:30, y:90 + 450 * 0.4 + 30, width:confirmView.frame.width - 60, height:30))
        let label4 = UILabel(frame:CGRect(x:0, y:140 + 450 * 0.4 + 30, width:confirmView.frame.width, height:50))
        label1.text = "Zhang Jiang Road"
        label1.font=UIFont(name:"Thonburi",size:12)
        label2.text = "*Teller"
        label2.font=UIFont(name:"Thonburi",size:12)
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "yyy-MM-dd' 'HH:mm"
        label3.text = timeFormatter.string(from: date) as String
        label4.text = "A" + String(num)
        label4.font=UIFont(name:"Thonburi",size:30)
        label4.textAlignment=NSTextAlignment.center
        var labColor=UIColor(white:1,alpha:1);
        labColor=UIColor.init(red:255.0/255,green:255.0/255,blue:0.0/255,alpha:1)
        labColor=UIColor.lightText
        labColor=UIColor.orange;
        label4.textColor=labColor
        confirmView.addSubview(label1);
        confirmView.addSubview(label2);
        confirmView.addSubview(label3);
        confirmView.addSubview(label4);
    }
    
    
    
}
