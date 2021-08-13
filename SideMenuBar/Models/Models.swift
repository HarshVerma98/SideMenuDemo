//
//  Models.swift
//  SideMenuBar
//
//  Created by Harsh Verma on 13/08/21.
//

import UIKit
enum Models: Int, CustomStringConvertible {
    case profile
    case about
    case contact
    case backup
    case cart
    
    
    var description: String {
        switch self {
            case .profile:
                return "Profile"
            case .about:
                return "Settings"
            case .contact:
                return "Contact"
            case .backup:
                return "Backup"
            case .cart:
                return "Cart"
        }
    }
    var imageView: UIImage {
        switch self {
            
            case .profile:
                return UIImage(systemName: "person.fill") ?? UIImage()
            case .about:
                return UIImage(systemName: "wrench.fill") ?? UIImage()
            case .contact:
                return UIImage(systemName: "phone.fill.connection") ?? UIImage()
            case .backup:
                return UIImage(systemName: "icloud.and.arrow.up.fill") ?? UIImage()
            case .cart:
                return UIImage(systemName: "cart.circle.fill") ?? UIImage()
        }
    }
}
