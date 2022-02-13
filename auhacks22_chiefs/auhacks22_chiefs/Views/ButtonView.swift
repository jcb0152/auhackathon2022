//
//  ButtonView.swift
//  auhacks22_chiefs
//
//  Created by Dan Nixon on 2/12/22.
//

import SwiftUI

struct ButtonView: View {
    var color: Color
    var destination: String
    var buttonText: String
    
    var body: some View {
        VStack {
            NavigationLink(destination: Text("NewPlan"), label: {
                ZStack {
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(color)
                    Text("\(buttonText)")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                }
            })
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(color: .red, destination: "NewPlan", buttonText: "Add plan")
    }
}
