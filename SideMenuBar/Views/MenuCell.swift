//
//  MenuCell.swift
//  SideMenuBar
//
//  Created by Harsh Verma on 13/08/21.
//

import UIKit

class MenuCell: UITableViewCell {

    
    var cellIcon: UIImageView = {
       let ixc = UIImageView()
        ixc.contentMode = .scaleAspectFit
        ixc.clipsToBounds = true
        return ixc
    }()
    
    var cellLabels: UILabel = {
       let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 26)
        l.textColor = .label
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
        addSubview(cellIcon)
        cellIcon.translatesAutoresizingMaskIntoConstraints = false
        cellIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        cellIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cellIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(cellLabels)
        cellLabels.translatesAutoresizingMaskIntoConstraints = false
        cellLabels.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellLabels.leftAnchor.constraint(equalTo: cellIcon.rightAnchor, constant: 12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
