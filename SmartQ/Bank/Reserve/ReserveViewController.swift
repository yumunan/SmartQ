//
//  ReserveViewController.swift
//  OnlineReservation
//
//  Created by Roy on 2019/6/3.
//  Copyright © 2019 citi. All rights reserved.
//

import UIKit

class ReserveViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    let optionName: [String] = ["取号预约","大额取现 (10万及以上)","虚拟柜员机 (VTM)"]
    let optionRemark: [String] = ["","(不可预约当天)","(2可用)"]
    let dateTime: [String] = ["今天 10:40~11:00","",""]
    let imgIcon: [String] = ["pepoicon","pepoicon","tickicon"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ReserveSelectionCell()
        
        if ((indexPath as NSIndexPath).row == 3){
            cell.optionName.text = "预约"
        } else {
            //cell.textLabel!.text=options[(indexPath as NSIndexPath).row]
            if(optionName[(indexPath as NSIndexPath).row] != ""){
                if(optionName[(indexPath as NSIndexPath).row]=="取号预约"){
                    cell.optionNameMid.text=optionName[(indexPath as NSIndexPath).row]
                }else{
                    cell.optionName.text=optionName[(indexPath as NSIndexPath).row]
                }
            }
            if(optionRemark[(indexPath as NSIndexPath).row] != ""){
                cell.optionRemark.text=optionRemark[(indexPath as NSIndexPath).row]
            }
            if(dateTime[(indexPath as NSIndexPath).row] != ""){
                cell.dateTime.text=dateTime[(indexPath as NSIndexPath).row]
            }
            //cell.detailTextLabel?.text = "gaga"
            cell.imgIcon.image = UIImage(named:imgIcon[(indexPath as NSIndexPath).row])
            //UIImageView(image:UIImage(named:"pepoicon"))
        }

        cell.accessoryType = ReserveSelectionCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setNavigation(Title: "Appointment");
        
        let reserveUIScrollView = ReserveUIScrollView.init(frame: CGRect(x:0, y:44, width:view.frame.width, height:view.frame.height))
        reserveUIScrollView.contentSize = CGSize(width: view.frame.width, height: 640)
//        self.view = UIScrollView.init(frame: CGRect(x:0, y:0, width:view.frame.width, height:730))
        let reserveHeaderFrame = CGRect(x:0, y:0, width:view.frame.width, height:200)
        let reserveHeader = ReserveHeaderView(frame: reserveHeaderFrame)
        reserveHeader.backgroundColor = UIColor.init(red: 102.0/255, green: 43.0/255, blue: 235.0/255, alpha: 1.0)
        reserveUIScrollView.addSubview(reserveHeader)
        
        let reserveTable = ReserveSelectionTableView.init(frame:CGRect(x:10, y:230, width:view.frame.width - 20, height:160), style: ReserveSelectionTableView.Style.plain)

        reserveTable.delegate = self
        reserveTable.dataSource = self
        reserveUIScrollView.addSubview(reserveTable)
        
        let reserveVoteUIView = ReserveVoteUIView.init(frame: CGRect(x:10, y:390, width:view.frame.width - 20, height:90))
        reserveUIScrollView.addSubview(reserveVoteUIView)

        
        let reserveVoteDetailsUIView  = ReserveVoteDetailsUIView.init(frame: CGRect(x:10, y:510, width:view.frame.width - 20, height:120))
        reserveVoteDetailsUIView.layer.masksToBounds = true
        reserveVoteDetailsUIView.layer.cornerRadius = 18;
        reserveVoteDetailsUIView.backgroundColor = UIColor.init(red: 230.0/255, green: 229.0/255, blue: 235.0/255, alpha: 1.0)
        reserveUIScrollView.addSubview(reserveVoteDetailsUIView)
        reserveUIScrollView.sizeThatFits(CGSize(width: view.frame.width, height: 720))
        self.view.addSubview(reserveUIScrollView);
//        self.view.addSubview(myDatePicker)

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if((indexPath as NSIndexPath).row == 0){
            let reserveDataPick = ReserveDataPick.init(frame: CGRect(x: 1, y: 0, width: view.frame.width - 20, height: 260))
            let alertController:UIAlertController=UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            alertController.addAction(UIAlertAction(title: "确定", style: UIAlertAction.Style.default){
                (alertAction)->Void in
                print("date select:" )
            })
            alertController.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel,handler:nil))
            alertController.view.addSubview(reserveDataPick)
            
            self.present(alertController, animated: true, completion: nil)
        } else if((indexPath as NSIndexPath).row == 3){
            let viewController = TicketViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
