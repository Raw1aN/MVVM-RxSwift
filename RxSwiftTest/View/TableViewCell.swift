//
//  TableViewCell.swift
//  RxSwiftTest
//
//  Created by Алексей Щукин on 15.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    let authorLabel = UILabel()
    let contentLabel = UILabel()
    
// MARK: - Inicialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textViewConstraintsSetup()
        contentlabelCustomizig()
        authorLabelConstraintsSetup()
        authorLabelCustomizing()
        cellCusomzing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
extension TableViewCell{
    func authorLabelConstraintsSetup(){
        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 20).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        authorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    func textViewConstraintsSetup(){
        addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
    }
}

// MARK: - Customizing
extension TableViewCell{
    func authorLabelCustomizing(){
        authorLabel.numberOfLines = 0
    }
    func contentlabelCustomizig(){
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont(name: contentLabel.font.fontName, size: 25)
    }
    func cellCusomzing(){
        selectionStyle = .none
    }
}
