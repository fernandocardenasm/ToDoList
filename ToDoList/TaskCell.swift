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
    
    
    var viewModel: ViewModel? {
        didSet {
            if let viewModel = viewModel {
                titleLabel.text = viewModel.title
                dueDateLabel.text = viewModel.dueDate
            }
        }
    }
    
    func setupViews() {
        
        //Without contentView. also works, but for the test it was necessary to add the views as subviews of contentView
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(dueDateLabel)
        
        contentView.backgroundColor = .green
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        
        dueDateLabel.translatesAutoresizingMaskIntoConstraints = false
        dueDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        dueDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dueDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        dueDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
}

extension TaskCell {
    struct ViewModel: Equatable {
        let title: String
        let dueDate: String
    }
}

extension TaskCell.ViewModel {
    init(task: Task) {
        title = task.title
        dueDate = "\(task.dueDate)"
    }
}
