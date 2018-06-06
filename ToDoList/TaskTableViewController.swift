//
//  ViewController.swift
//  ToDoList
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var upcomingTaskDataManager: UpcomingTaskDataManager?
    
    private var upcomingTaskDataManagerTableViewAdapter: UpcomingTaskDataManagerTableViewAdapter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        upcomingTaskDataManager = UpcomingTaskDataManager()
        
        upcomingTaskDataManagerTableViewAdapter = UpcomingTaskDataManagerTableViewAdapter(upcomingTaskDataManager: upcomingTaskDataManager!)
        
        tableView.dataSource = upcomingTaskDataManagerTableViewAdapter
        tableView.delegate = upcomingTaskDataManagerTableViewAdapter

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


class UpcomingTaskDataManagerTableViewAdapter: NSObject {
    
    let upcomingTaskDataManager: UpcomingTaskDataManager
    
    init(upcomingTaskDataManager: UpcomingTaskDataManager) {
        self.upcomingTaskDataManager = upcomingTaskDataManager
    }
    
}

extension UpcomingTaskDataManagerTableViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return upcomingTaskDataManager.numberOfTasks(inSection: section)

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return upcomingTaskDataManager.titleOfSection(at: section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return upcomingTaskDataManager.numberOfSections()
    }
    
}


extension UpcomingTaskDataManagerTableViewAdapter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


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
