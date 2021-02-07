//
//  TaskStore.swift
//  TahDoodle
//
//  Created by ZELIMKHAN MAGAMADOV on 04.02.2021.
//

import Foundation

class TaskStore: ObservableObject {
	
	private let fileURL: URL = {
		let fileManager = FileManager.default
		let documentDirectories = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
		let myDocumentDirectory = documentDirectories.first!
		let fileTasksURL = myDocumentDirectory.appendingPathComponent("tasks.json")
		return fileTasksURL
	}()
	
	@Published private(set) var tasks: [Task] = []
	
	func add(_ task: Task) {
		tasks.append(task)
		saveTasks()
	}
	
	func remove(_ task: Task) {
		guard let index = tasks.firstIndex(of: task) else { return }
		tasks.remove(at: index)
		saveTasks()
	}
	
	private func saveTasks() {
		do {
			let encoder = JSONEncoder()
			let data = try encoder.encode(tasks)
			try data.write(to: fileURL)
		} catch {
			print("Could not save tasks. Reason: \(error)")
		}
	}
	
	private func loadTasks() {
		do {
			let data = try Data(contentsOf: fileURL)
			let decoder = JSONDecoder()
			tasks = try decoder.decode([Task].self, from: data)
		} catch {
			print("Did not load any tasks. Reason: \(error)")
		}
	}
	
	init() {
		loadTasks()
	}
}

#if DEBUG
extension TaskStore {
	static var sample: TaskStore = {
		let tasks = [
			Task(title: "Add features"),
			Task(title: "Fix bugs"),
			Task(title: "Ship it")
		]
		let store = TaskStore()
		store.tasks = tasks
		return store
	}()
}
#endif
