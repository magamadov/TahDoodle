//
//  TaskListView.swift
//  TahDoodle
//
//  Created by ZELIMKHAN MAGAMADOV on 04.02.2021.
//

import SwiftUI

struct TaskListView: View {

	@ObservedObject var taskStore: TaskStore
	
	var body: some View {
		List {
			ForEach(taskStore.tasks) {
				TaskView(title: $0.title)
			}.onDelete { indexSet in
				indexSet.forEach { (index) in
					let task = taskStore.tasks[index]
					taskStore.remove(task)
				}
			}
		}
	}
}

struct TaskList_Preview: PreviewProvider {
	static var previews: some View {
		TaskListView(taskStore: .sample)
	}
}
