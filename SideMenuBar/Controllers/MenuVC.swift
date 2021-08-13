//
//  MenuVC.swift
//  SideMenuBar
//
//  Created by Harsh Verma on 13/08/21.
//

import UIKit

class MenuVC: UIViewController {
    
    var table: UITableView!
    var delegate: Toggle?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCells()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(table)
        table.frame = view.bounds
    }
   
    func setCells() {
        table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 80
        table.separatorStyle = .none
        table.backgroundColor = .darkGray
        table.register(MenuCell.self, forCellReuseIdentifier: "ids")
    }
    
}
extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "ids", for: indexPath) as! MenuCell
        let modelOption = Models(rawValue: indexPath.row)
        cell.cellLabels.text = modelOption?.description
        cell.cellIcon.image = modelOption?.imageView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let modelOption = Models(rawValue: indexPath.row)
        delegate?.slider(foroptions: modelOption)
    }
    
    
}
