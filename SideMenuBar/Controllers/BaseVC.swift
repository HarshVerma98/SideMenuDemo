//
//  ViewController.swift
//  SideMenuBar
//
//  Created by Harsh Verma on 13/08/21.
//

import UIKit

class BaseVC: UIViewController {
    
    var centre: UIViewController!
    var menu: MenuVC!
    var isExpanded: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callHome()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    func callHome() {
        let home = HomeVC()
        home.delegate = self
        centre = UINavigationController(rootViewController: home)
        view.addSubview(centre.view)
        addChild(centre)
        centre.didMove(toParent: self)
    }
    
    func callMenu() {
        if menu == nil {
            menu = MenuVC()
            menu.delegate = self
            view.insertSubview(menu.view, at: 0)
            addChild(menu)
            menu.didMove(toParent: self)
        }
    }
    
    func isCurrentlyVisible(show: Bool, popOptions: Models?) {
        if show {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centre.view.frame.origin.x = self.centre.view.frame.width - 130
                self.setNeedsStatusBarAppearanceUpdate()
            }, completion: nil)
        }else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centre.view.frame.origin.x = 0
            }) { _ in
                guard let unwrapped = popOptions else {
                    return
                }
                self.shouldPopOptions(opt: unwrapped)
            }
        }
        animateStatusBar()
    }
    
    func shouldPopOptions(opt: Models) {
        switch opt {
            
            case .profile:
                print("Profile")
            case .about:
                let newVC = SettingsVC()
                let nvc = UINavigationController(rootViewController: newVC)
                nvc.modalTransitionStyle = .flipHorizontal
                nvc.modalPresentationStyle = .fullScreen
                present(nvc, animated: true, completion: nil)
            case .contact:
                print("contact")
            case .backup:
                print("backup")
            case .cart:
                print("Cart")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
}

extension BaseVC: Toggle {
    func slider(foroptions Option: Models?) {
        if !isExpanded {
            callMenu()
        }
        isExpanded = !isExpanded
        isCurrentlyVisible(show: isExpanded, popOptions: Option)
    }
    
}
