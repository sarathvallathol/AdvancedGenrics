//
//  SampleTableViewController.swift
//  AdvancedGenerics
//
//  Created by sarath on 03/07/18.
//  Copyright © 2018 com.sarath.tutorials. All rights reserved.
//

import UIKit

class SampleTableViewController: UITableViewController {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }


}
