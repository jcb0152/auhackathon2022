//
//  RankList.swift
//  auhacks22_chiefs
//
//  Created by Dan Nixon on 2/12/22.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct RankList: View {
    @State private var editMode = EditMode.inactive
    @State private var items: [Item] = (0..<5).map { Item(title: "Item #\($0)") }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text(item.title)
                }
            }
            .navigationBarTitle("List")
            .navigationBarItems(leading: EditButton())
            .environment(\.editMode, $editMode)
        }
    }
}
    
struct RankList_Previews: PreviewProvider {
    static var previews: some View {
        RankList()
    }
}
