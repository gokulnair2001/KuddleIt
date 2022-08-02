//
//  HomeView.swift
//  Kuddle-Assignment
//
//  Created by Gokul Nair on 02/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var classVM = ClassViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
             
                NavigationLink(destination: YogaView().environmentObject(classVM)) {
                        ZStack(alignment: .bottomTrailing) {
                            if !classVM.YogaData.isEmpty {
                                cards(title: "Yoga", capacity: String("\(classVM.YogaData[0].attendees.count)/\(classVM.YogaData[0].capacity)"))
                            }
                        }
                    }
                
                NavigationLink(destination: DanceView().environmentObject(classVM)) {
                    ZStack(alignment: .bottomTrailing) {
                        if !classVM.danceData.isEmpty {
                            cards(title: "Dance", capacity: String("\(classVM.danceData[0].attendees.count)/\(classVM.YogaData[0].capacity)"))
                        }
                        
                    }
                }
                
                NavigationLink(destination: GymView().environmentObject(classVM)) {
                    ZStack(alignment: .bottomTrailing) {
                       
                        if !classVM.gymData.isEmpty {
                            cards(title: "Gym", capacity: String("\(classVM.gymData[0].attendees.count)/\(classVM.YogaData[0].capacity)"))
                        }
                    }
                }
               
            }
            .navigationTitle("KuddleIt")
        }.onAppear {
            classVM.fetchData()
        }
    }
    
    @ViewBuilder
    func cards(title: String, capacity: String) -> some View {
        Text(title)
            .font(.system(size: 23, weight: .heavy, design: .monospaced))
            .foregroundColor(.black)
            .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 3, x: 0, y: 0)
        
        HStack {
            Text(capacity)
                .bold()
                .frame(width: 60, height: 60, alignment: .center)
                .background(.orange)
                .cornerRadius(30)
            
        }.padding(15)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
