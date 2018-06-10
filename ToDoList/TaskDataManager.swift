//
//  TaskDataManager.swift
//  ToDoList
//
//  Created by Fernando on 07.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class TaskDataManager {
    private var sections: [Section<Task>] = [
        Section<Task>(title: "Now", items: [Task(title: "First Task Overdue", dueDateTimestamp: 1), Task(title: "Second Task overdue", dueDateTimestamp: 12345)]),
        Section<Task>(title: "Soon", items: [Task(title: "First Task Now", dueDateTimestamp: 2)]),
        Section<Task>(title: "Upcoming", items: [Task(title: "First Task Upcoming", dueDateTimestamp: 3)])
    ]
    
    //    private var sections: [Section<Task>] = []
    
    func add(section: Section<Task>) {
        sections.append(section)
    }
    
    func add(task: Task, inSection index: Int) {
        sections[index].items.append(task)
    }
    
    func removeSection(at index: Int) {
        sections.remove(at: index)
    }
    
    func removeTask(at indexTask: Int, inSection indexSection: Int) {
        sections[indexSection].items.remove(at: indexTask)
    }
    
    func removeAllSections() {
        sections.removeAll()
    }
    
    func removeTasks(inSection index: Int) {
        sections[index].items.removeAll()
    }
    
    //It could be improved with a higer order function, but it shows an error that section is inmmutable
    func removeTasksInAllSections() {
        for index in 0...numberOfSections() - 1{
            sections[index].items.removeAll()
        }
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfTasks(inSection index: Int) -> Int{
        return sections[index].items.count
    }
    
    func titleOfSection(at index: Int) -> String {
        return sections[index].title
    }
    
    func task(at indexTask: Int, inSection indexSection: Int) -> Task {
        return sections[indexSection].items[indexTask]
    }
    
}
