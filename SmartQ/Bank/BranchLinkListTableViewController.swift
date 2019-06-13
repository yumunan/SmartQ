//
//  BranchLinkListTableViewController.swift
//  SmartQ
//
//  Created by 何大海 on 2019/6/10.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class BranchLinkListTableViewController: UITableViewController {
    
    var branchLinkList = [BranchLink]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadBankLinkList()
        print("after")
        print(branchLinkList)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    func getBankLinkArray() ->NSArray {
        print("load bank list list")
        let path = Bundle.main.path(forResource: "BranchList", ofType: "json")
        print(path)
        let data = NSData(contentsOfFile: path!)
        print(data)
        var json: Any?
        do {
            json = try JSONSerialization.jsonObject(with: data! as Data, options: []) as! [[String:AnyObject]]
            
            //        guard let path = Bundle.main.path(forResource: "main", ofType: "json"),
            //            let data = NSData(contentsOfFile: path),
            //            let array = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [[String: Any]]
            //        else {
            //            print("err")
            //            return
            //        }
            if json != nil {
                return json as! NSArray
            }
            print(json)
            
        } catch {
            print(error)
        }
        return []
    }
    
    struct BranchTemp: Decodable {
        var branchId: String
        var branchName: String
        var branchDistance: String
    }
    
    func loadBankLinkList() -> () {
        guard let fileURL = Bundle.main.url(forResource: "BranchList.json", withExtension: nil),
            let data = try? Data.init(contentsOf: fileURL) else{
                fatalError("`JSON File Fetch Failed`")
        }
        let decoder = JSONDecoder()
        guard let temp = try? decoder.decode([BranchTemp].self, from: data) else{
            fatalError("`JSON Decode Failed`")
        }
        print(temp)
        
        for i in 0..<temp.count {
            let b = BranchLink()
            b.branchName = temp[i].branchName
            b.branchId = temp[i].branchId
            b.branchDistance = temp[i].branchDistance
            print(b.branchName)
            branchLinkList.append(b)
        }
        //        tableView.reloadData()
        //        print("load bank list list")
        //        let path = Bundle.main.path(forResource: "BranchList", ofType: "json")
        //        print(path)
        //        let data = NSData(contentsOfFile: path!)
        //        print(data)
        //        do {
        //            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
        //                let array = json as? [[String: Any]] else{
        //                    fatalError("`JSON Data Serialize Failed`")
        //            }
        ////            let json = try JSONSerialization.jsonObject(with: data! as Data, options: [])
        //            print(json)
        //            let array = json as? [[String: Any]]
        //
        //            print(array!)
        //            for branchLink in array {
        //
        //            }
        //        } catch {
        //            print(error)
        //        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return branchLinkList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = branchLinkList[indexPath.row].branchName
        cell.detailTextLabel?.text = branchLinkList[indexPath.row].branchDistance
        return cell
    }
}
