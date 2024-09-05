//
//  Citizen.swift
//  SetDemo
//
//  Created by Antti Juustila on 4.9.2024.
//

import Foundation

struct Citizen {
	let personID: String
	let name: String

}

//extension Citizen: Hashable {
//	func hash(into hasher: inout Hasher) {
//		hasher.combine(personID)
//	}
//}
//
//extension Citizen: Equatable {
//	static func == (lhs: Citizen, rhs: Citizen) -> Bool {
//		lhs.personID == rhs.personID
//	}
//}

extension Citizen: CustomStringConvertible {
	var description: String {
		"\(personID) \(name)"
	}
}
