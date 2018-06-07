//
//  UpcomingTaskDataManager.swift
//  ToDoList
//
//  Created by Fernando on 05.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

class UpcomingTaskDataManager {
    private var sections: [Section<Task>] = [
                    Section<Task>(title: "To do soon", items: [Task(title: "First Task", dueDate: 1), Task(title: "Second Task", dueDate: 12345)]),
                    Section<Task>(title: "Soon", items: [Task(title: "Second Task", dueDate: 2)]),
                    Section<Task>(title: "More future", items: [Task(title: "Third Task", dueDate: 3)])
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



