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
        Section<Task>(title: "Now", items: [Task(title: "First Task Overdue", dueDateTimestamp: 1532024500), Task(title: "Second Task overdue", dueDateTimestamp: 1532054600)]),
        Section<Task>(title: "Soon", items: [Task(title: "First Task Now", dueDateTimestamp: 1532144700)]),
        Section<Task>(title: "Upcoming", items: [Task(title: "First Task Upcoming", dueDateTimestamp: 1732044800)])
    ]
    
    init() {
        orderByDueDate()
    }
    
    func orderByDueDate(){
        
        //Extra variables are needed so we can modify the array, otherwise the elements appear as inmutable.
        sections = sections.map { section -> Section<Task> in
            
            var sectionAux = section
            var items = section.items
            items.sort { $0.dueDateTimestamp < $1.dueDateTimestamp }
//
            sectionAux.items = items
            return sectionAux
            
        }
    }
    
    //    private var sections: [Section<Task>] = []
    
    func add(section: Section<Task>) {
        sections.append(section)
    }
    
    func add(task: Task, inSection index: Int) {
        
        sections[index].items.sort {$0.dueDateTimestamp < $1.dueDateTimestamp }
        
        let timestamps = sections[index].items.map{ $0.dueDateTimestamp }
        let indexNewTask = timestamps.insertionIndexOf(elem: task.dueDateTimestamp, isOrderedBefore: { $0 < $1 })
        
        sections[index].items.insert(task, at: indexNewTask)
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
    
    func removeTasksInAllSections() {
        
        sections = sections.map { section -> Section<Task> in
            var sectionAux = section
            
            sectionAux.items.removeAll()
            return sectionAux
            
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
