//
//  Gradients.swift
//  SideMenuBar
//
//  Created by Harsh Verma on 13/08/21.
//

import UIKit
final class Gradient: UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    init(color: [UIColor]) {
        super.init(frame: .zero)
        let gradLayer = layer as! CAGradientLayer
        gradLayer.colors = color.map { $0.cgColor}
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

