//
//  Task.swift
//  TahDoodle
//
//  Created by ZELIMKHAN MAGAMADOV on 04.02.2021.
//

import Foundation

struct Task: Equatable, Identifiable, Codable {
	var id: UUID
	let title: String
	
	init(title: String) {
		self.id = UUID()
		self.title = title
	}
}

