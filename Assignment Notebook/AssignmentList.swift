//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Yashwanth Ravipati on 7/28/21.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "English", description: "Take out trash", dueDate: Date()),
                            AssignmentItem(course: "Math", description: "Pick up clothes", dueDate: Date()),
                            AssignmentItem(course: "Science", description: "Eat a donut", dueDate: Date())] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}


