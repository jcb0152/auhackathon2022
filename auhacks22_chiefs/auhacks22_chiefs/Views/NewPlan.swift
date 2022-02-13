//
//  NewPlan.swift
//  auhacks22_chiefs
//
//  Created by Dan Nixon on 2/12/22.
//

import SwiftUI

struct NewPlan: View {
    var body: some View {
        VStack {
            Text("Add new plan")
            Divider()
            Text("Save this plan?")
        }
    }
}

struct NewPlan_Previews: PreviewProvider {
    static var previews: some View {
        NewPlan()
    }
}
