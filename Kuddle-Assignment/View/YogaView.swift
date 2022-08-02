//
//  YogaView.swift
//  Kuddle-Assignment
//
//  Created by Gokul Nair on 02/08/22.
//

import SwiftUI

struct YogaView: View {
    
    @EnvironmentObject var vm: ClassViewModel
    
    var body: some View {

            VStack {
                
                Text("Attendees")
                    .bold()
                if !vm.YogaData.isEmpty {
                    List(vm.YogaData[0].attendees, id: \.self) { people in
                        Text(people)
                    }
                    
                    Text("Waiting list")
                        .bold()
                    List(vm.YogaData[0].waitingList, id: \.self) { people in
                        Text(people)
                    }
                }
                
                Spacer()
                
                Button{
                   
                    vm.enrollYoga(name: "Harsh")
                    
                }label: {
                    Text("Register")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 70, alignment: .center)
                        .background(.blue)
                        .cornerRadius(20)
                }
            }
            .navigationTitle("Yoga")
            .alert(vm.message, isPresented: vm.$isEligible) {
                Button("Ok", role: .cancel){}
            }
    }
}

struct YogaView_Previews: PreviewProvider {
    static var previews: some View {
        YogaView()
    }
}
