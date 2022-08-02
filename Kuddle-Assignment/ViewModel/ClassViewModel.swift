//
//  ClassViewModel.swift
//  Kuddle-Assignment
//
//  Created by Gokul Nair on 02/08/22.
//

import Foundation
import UIKit
import SwiftUI

class ClassViewModel: ObservableObject {
    
    @Published var YogaData:[ClassModel] = [ClassModel]()
    @Published var danceData:[ClassModel] = [ClassModel]()
    @Published var gymData:[ClassModel] = [ClassModel]()
    
    @State var isEligible:Bool = false
    @State var message:String = ""
    
    func fetchData() {
        yogaClassHandler()
        danceClassHandler()
        gymClassHandler()
    }
    
    func yogaClassHandler() {
        YogaData.append(ClassModel(name: ["Gokul"], capacity: 3, attendees: ["Gokul"], timing: Date(), waitingList: []))
    }
    
    func gymClassHandler(){
        gymData.append(ClassModel(name: ["Gokul", "Vraj", "Priya"], capacity: 3, attendees: ["Gokul", "Vraj", "Priya"], timing: Date(), waitingList: ["Pearl"]))
        
    }
    
    func danceClassHandler() {
        danceData.append(ClassModel(name: ["Gokul"], capacity: 3, attendees: ["Gokul"], timing: Date(), waitingList: []))
    }
    
    func enrollYoga(name: String) {
        
        if YogaData[0].capacity == YogaData[0].attendees.count {
            isEligible = false
            message = "Class is full, added to the waiting list"
            YogaData[0].waitingList.append(name)
        }
        
        print(YogaData[0].attendees)
        
        
        
        if YogaData[0].capacity > YogaData[0].attendees.count {
            
            if YogaData[0].attendees.contains(name) {
                isEligible = false
                message = "You already registered"
            }else {
                YogaData[0].attendees.append(name)
            }
        }
        
    }
}
