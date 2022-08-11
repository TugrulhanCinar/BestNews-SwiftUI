//
//  ContentView.swift
//  BestNews-SwiftUI
//
//  Created by Tugrulhan Çınar on 4.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isSideBarOpened = false

    var body: some View {
        SideMenu(isSidebarVisible: $isSideBarOpened)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
