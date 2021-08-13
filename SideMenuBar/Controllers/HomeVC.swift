//
//  HomeVC.swift
//  SideMenuBar
//
//  Created by Harsh Verma on 13/08/21.
//

import UIKit

class HomeVC: UIViewController {

    
    var delegate: Toggle?
    private lazy var backgrounds: Gradient = {
        let v = Gradient(color: [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)])
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBars()
        setupViews()
        constraints()
        // Do any additional setup after loading the view.
    }
    

    func configureBars() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Home Screen"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(didPressBar))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
    func setupViews() {
        view.addSubview(backgrounds)
    }
    
    func constraints() {
        NSLayoutConstraint.activate([backgrounds.leadingAnchor.constraint(equalTo: view.leadingAnchor), backgrounds.trailingAnchor.constraint(equalTo: view.trailingAnchor),backgrounds.topAnchor.constraint(equalTo: view.topAnchor),backgrounds.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    
    @objc func didPressBar() {
        delegate?.slider(foroptions: nil)
    }
}
