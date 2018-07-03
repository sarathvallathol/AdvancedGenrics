//
//  SampleTableViewController.swift
//  AdvancedGenerics
//
//  Created by sarath on 03/07/18.
//  Copyright © 2018 com.sarath.tutorials. All rights reserved.
//

import UIKit

class BaseTableViewController<T: BaseCell<U>, U >: UITableViewController {

    let cellId = "cellId"
    
    var items = [U]()
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.register(T.self, forCellReuseIdentifier: cellId)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCell<U>
        cell.item = items[indexPath.row]
        return cell
    }


}

class BaseCell<U>: UITableViewCell {
    
    var item: U!

}
struct Dog {
    
    let name:String
    
}
class DogCell: BaseCell<Dog> {
    override var item: Dog!{
        
        didSet{
            textLabel?.text = item.name
        }
    }
    
}
class  StringCell: BaseCell<String> {
    
    override var item: String!{
        
        didSet{
            textLabel?.text = "\(item)"
        }
    }
    
}
class DummyController : BaseTableViewController<StringCell, String> {
    
}
class SomeListController: BaseTableViewController<DogCell, Dog> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [
            Dog(name: "woof woof"),
            Dog(name: "Ruff Ruff")
        ]
    }
    
  
}
