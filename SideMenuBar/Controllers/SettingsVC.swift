//
//  SettingsVc.swift
//  SideMenuBar
//
//  Created by Harsh Verma on 13/08/21.
//
import UIKit

struct SettingsCell {
    let title: String
}
//MARK:- Class Definition
class SettingsVC: UIViewController {
    
    var data = [[SettingsCell]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNavBar()
        view.addSubview(tableView)
        configureModelForCell()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    //MARK:- User Defined Function Here
    func initializeNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBar))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
    @objc func didTapBar() {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureModelForCell() {
        data.append([SettingsCell(title: "Airplane Mode"), SettingsCell(title: "Wifi"), SettingsCell(title: "Bluetooth"), SettingsCell(title: "Mobile Data"), SettingsCell(title: "Personal Hotspot"), SettingsCell(title: "VPN")])
        
        data.append([SettingsCell(title: "Home"), SettingsCell(title: "Issued Document"), SettingsCell(title: "Uploaded Documents"), SettingsCell(title: "Share")])
        
        data.append([SettingsCell(title: "Connect to App Store")])
        
        data.append([SettingsCell(title: "Access Developer Version"), SettingsCell(title: "Netwrork Connectivity Check"), SettingsCell(title: "PRN Status")])
    }
}
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

