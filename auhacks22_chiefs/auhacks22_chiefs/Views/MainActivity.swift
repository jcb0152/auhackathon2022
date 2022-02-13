//
//  main_activity.swift
//  auhacks22_chiefs
//
//  Created by Dan Nixon on 2/12/22.
//

import SwiftUI

struct MainActivity: View {
    var body: some View {
            NavigationView {
                VStack {
                    // New Plan button.
                    NavigationLink(destination: Text("NewPlan"), label: {
                        ButtonView(color: .red, destination: "NewPlan", buttonText: "Create Plan")
                    })
                    Divider()
                    // Presets button.
                    NavigationLink(destination: Text("ExistingSaves"), label: {
                        ButtonView(color: .red, destination: "ExisitingSaves", buttonText: "Saved Plans")
                    })
                }
                .navigationTitle("Main Page")
            }
    }
}

struct MainActivity_Previews: PreviewProvider {
    static var previews: some View {
        MainActivity()
    }
}
