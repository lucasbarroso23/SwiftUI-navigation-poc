//
//  navigationpocApp.swift
//  navigationpoc
//
//  Created by Lucas Barroso IZ on 06/01/2023.
//

import SwiftUI

class NavigationHelper: ObservableObject {
    @Published var selection: String? = nil
}

@main
struct navigationpocApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environmentObject(AppState())
//            BackPortView()
//            ArrayBindingView()
//            RootView()
            UiPilot()
        }
    }
}
