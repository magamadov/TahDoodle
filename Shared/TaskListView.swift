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
			ForEach(taskStore.tasks) { task in
				#if os(macOS)
				TaskView(title: task.title)
					.contextMenu {
						Button("Delete") {
							taskStore.remove(task)
						}
					}
					//.animation(.easeIn)
				#else
				TaskView(title: task.title)
					//.animation(.easeIn)
				#endif
			}.onDelete { indexSet in
				indexSet.forEach { (index) in
					let task = taskStore.tasks[index]
					taskStore.remove(task)
				}
			}
		}
		.animation(.easeIn)
	}
}

struct TaskList_Preview: PreviewProvider {
	static var previews: some View {
		TaskListView(taskStore: .sample)
	}
}
