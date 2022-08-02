//
//  ClassModel.swift
//  Kuddle-Assignment
//
//  Created by Gokul Nair on 02/08/22.
//

import Foundation


// MARK: - Model class for the classes
struct ClassModel: Codable, Identifiable {
    
    let id = UUID()
    
    var name: [String]
    var capacity: Int
    var attendees: [String]
    var timing: Date
    var waitingList: [String]

}
