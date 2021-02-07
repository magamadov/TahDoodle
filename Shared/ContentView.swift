//
//  ContentView.swift
//  Shared
//
//  Created by ZELIMKHAN MAGAMADOV on 03.02.2021.
//

import SwiftUI

struct ContentView: View {
	
	let taskStore: TaskStore
	
	var body: some View {
		VStack {
			NewTaskView(taskStore: taskStore)
			TaskListView(taskStore: taskStore)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(taskStore: .sample)
		
	}
}
