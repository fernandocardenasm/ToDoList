//
//  AddViewController.swift
//  ToDoList
//
//  Created by Fernando on 08.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    let addView = AddView()
    
    weak var addTaskDelegate: AddTaskDelegate?
    
    //Added just for the test
    private(set) var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddView()
        setupNavigationBar()
        
    }
}

protocol AddTaskDelegate: AnyObject {
    func saveTask(task: Task)
}

extension AddViewController {
    
    fileprivate func setupAddView() {
        view.addSubview(addView)
        addView.backgroundColor = .white
        addView.translatesAutoresizingMaskIntoConstraints = false
        addView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        addView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        addView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        addView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    func setupNavigationBar() {
        navigationItem.title = "New Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(createTask))
    }
    
    @objc func createTask(){
        
        let title = addView.titleTextField.text!
        
        if isInputDataValid(title: title) {
            //The date is passed is a string to keep the consistency of the viewmodel and not and extra struct
            let viewModel = TaskCell.ViewModel(title: title, dueDate: "\(addView.dueDateDatePicker.date)")
            task = viewModel.task
            
            addTaskDelegate?.saveTask(task: task!)
            _ = navigationController?.popViewController(animated: true)
            
        }
        else {
            print("The title is not valid.")
        }
    }
    
    func isInputDataValid(title: String) -> Bool {
        let taskValidator = TaskInputsValidator()
        
        if taskValidator.isTitleValid(title: title) {
            return true
        }
        return false
    }
    
}

class AddView: UIView {
    
    //Not used, but useful how to create a UINavigationBar
//    lazy var addNavigationBar: UINavigationBar = {
//        let navigationBar = UINavigationBar()
//        let navigationItem = UINavigationItem(title: "New Task")
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissView))
//        navigationBar.pushItem(navigationItem, animated: false)
//        return navigationBar
//    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add your task here"
        return textField
    }()
    
    lazy var dueDateDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        addSubview(titleTextField)
        addSubview(dueDateDatePicker)
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        dueDateDatePicker.translatesAutoresizingMaskIntoConstraints = false
        dueDateDatePicker.topAnchor.constraint(equalTo: titleTextField.bottomAnchor).isActive = true
        dueDateDatePicker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dueDateDatePicker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }
    
}
