//
//  ContentView.swift
//  navigationpoc
//
//  Created by Lucas Barroso IZ on 06/01/2023.
//

import SwiftUI


class AppState: ObservableObject {
    @Published var view1: Bool = false
    @Published var view2: Bool = false
    @Published var view3: Bool = false
    @Published var view4: Bool = false
    @Published var view5: Bool = false

    @Published var movedToDashboard = false

    func moveToDashboard() {
        view1 = false
        movedToDashboard = true
    }

    func moveFrom5To3() {
        view4 = false
        view5 = false
    }

}

struct ContentView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            VStack {
                Text("Content View")
                    .font(.headline)

                NavigationLink(destination: View1NoLib(), isActive: $appState.view1) {

                    Button("Move to View1") {
                        appState.view1 = true
                    }
                }
                .isDetailLink(false)
            }
            .onReceive(appState.$movedToDashboard) { moved in
                if moved {
                    print("Move to dashboard: \(moved)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                        appState.view2 = false
                        appState.view3 = false
                        appState.view4 = false
                        appState.view5 = false
                    }

                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct View1NoLib: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack {
            Text("View1")
                .font(.headline)

            NavigationLink(destination: View2NoLib(), isActive: $appState.view2) {

                Button("Move to View2") {
                    appState.view2 = true
                }
            }
            .isDetailLink(false)
        }
    }

}

struct View2NoLib: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack {
            Text("View2")
                .font(.headline)

            NavigationLink(destination: View3NoLib(), isActive: $appState.view3) {

                Button("Move to View3") {
                    appState.view3 = true
                }
            }
            .isDetailLink(false)
        }
    }

}

struct View3NoLib: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack {
            Text("View3")
                .font(.headline)


            NavigationLink(destination: View4NoLib(), isActive: $appState.view4) {

                Button("Move to View4") {
                    appState.view4 = true
                }
            }
            .isDetailLink(false)
        }
    }

}


struct View4NoLib: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack {
            Text("View4")
                .font(.headline)



            NavigationLink(destination: View5NoLib(), isActive: $appState.view5) {

                Button("Move to View5") {
                    appState.view5 = true
                }
            }
            .isDetailLink(false)
        }
    }

}


struct View5NoLib: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack {
            Text("View5")
                .font(.headline)
            Button {
                withAnimation(.easeInOut(duration: 1)) {
                    appState.moveToDashboard()
                }
            } label: {
                Text("Move to Dash")
                    .font(.headline)
            }

            Button {
                appState.moveFrom5To3()
            } label: {
                Text("Move to view3")
                    .font(.headline)
            }


        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

