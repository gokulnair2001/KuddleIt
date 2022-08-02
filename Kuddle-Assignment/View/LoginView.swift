//
//  LoginView.swift
//  Kuddle-Assignment
//
//  Created by Gokul Nair on 02/08/22.
//

import SwiftUI

struct LoginView: View {
    
    let userName = ["Gokul", "Nikhil"]
    @State var currentUser: String = ""
    @State var isValid: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("KuddleIt")
                    .font(.system(size: 45, weight: .medium, design: .monospaced))
                
                TextField(text: $currentUser) {
                    Text("UserName")
                       
                }  .frame(width: 300, height: 60, alignment: .center)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                
                    Button{
                        if userName.contains(currentUser) {
                           isValid = true
                        }
                    }label: {
                        Text("Login")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 250, height: 80, alignment: .center)
                            .background(.blue)
                            .cornerRadius(20)
                    }.padding(.top, 40)
                }
           
        }
        .fullScreenCover(isPresented: $isValid) {
            HomeView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
