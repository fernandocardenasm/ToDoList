//
//  TaskCell.swift
//  ToDoList
//
//  Created by Fernando on 07.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "First task"
        return label
    }()
    
    lazy var dueDateLabel: UILabel = {
        let label = UILabel()
        label.text = "3 days"
        label.textAlignment = .right
        return label
    }()
    
    func configCell(with task: Task){
        
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(dueDateLabel)
        
        backgroundColor = .green
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        
        dueDateLabel.translatesAutoresizingMaskIntoConstraints = false
        dueDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        dueDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dueDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dueDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
