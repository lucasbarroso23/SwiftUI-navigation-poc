////
////  tagnavigation.swift
////  navigationpoc
////
////  Created by Lucas Barroso IZ on 07/01/2023.
////
//
//import SwiftUI
//
///// third try
//enum routes: Hashable {
//
//    case view1
//    case view2
//    case view3
//    case view4
//    case view5
//
//}
//
//class AppState: ObservableObject {
////    @Published var view1: Bool = false
////    @Published var view2: Bool = false
////    @Published var view3: Bool = false
////    @Published var view4: Bool = false
////    @Published var view5: Bool = false
////
////    @Published var movedToDashboard = false
//    @Published var moveTo: [routes]? = []
//
//    func moveToDashboard() {
////        view1 = false
////        movedToDashboard = true
//        moveTo = []
//    }
//
//    func moveFrom5To3() {
////        view4 = false
////        view5 = false
//        moveTo?.removeLast()
//        moveTo?.removeLast()
//    }
//
//}
//
//struct ContentView: View {
//    @EnvironmentObject var appState: AppState
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Content View")
//                    .font(.headline)
//
//                NavigationLink(
//                    destination: View1(),
//                    tag: [routes.view1],
//                    selection: $appState.moveTo
//                ) {
//
//                    Button("Move to View1") {
//                        appState.moveTo?.append(.view1)
//                    }
//                }
//                .isDetailLink(false)
//            }
////            .onReceive(appState.$movedToDashboard) { moved in
////                if moved {
////                    print("Move to dashboard: \(moved)")
////                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
////                        appState.view2 = false
////                        appState.view3 = false
////                        appState.view4 = false
////                        appState.view5 = false
////                    }
////
////                }
////            }
//        }
//        .navigationViewStyle(.stack)
//    }
//}
//
//struct View1: View {
//    @EnvironmentObject var appState: AppState
//
//    var body: some View {
//
//        VStack {
//            Text("View1")
//                .font(.headline)
//
//            NavigationLink(
//                destination: View2(),
//                tag: [routes.view2],
//                selection: $appState.moveTo) {
//
//                Button("Move to View2") {
//                    appState.moveTo?.append(.view2)
//                }
//            }
//            .isDetailLink(false)
//        }
//    }
//
//}
//
//struct View2: View {
//    @EnvironmentObject var appState: AppState
//
//    var body: some View {
//
//        VStack {
//            Text("View2")
//                .font(.headline)
//
//            NavigationLink(
//                destination: View3(),
//                tag: [routes.view3],
//                selection: $appState.moveTo) {
//
//                Button("Move to View3") {
//                    appState.moveTo?.append(.view3)
//                }
//            }
//            .isDetailLink(false)
//        }
//    }
//
//}
//
//struct View3: View {
//    @EnvironmentObject var appState: AppState
//
//    var body: some View {
//
//        VStack {
//            Text("View3")
//                .font(.headline)
//
//
//            NavigationLink(
//                destination: View4(),
//                tag: [routes.view4],
//                selection: $appState.moveTo) {
//
//                Button("Move to View4") {
//                    appState.moveTo?.append(.view4)
//                }
//            }
//            .isDetailLink(false)
//        }
//    }
//
//}
//
//
//struct View4: View {
//    @EnvironmentObject var appState: AppState
//
//    var body: some View {
//
//        VStack {
//            Text("View4")
//                .font(.headline)
//
//
//
//            NavigationLink(
//                destination: View5(),
//                tag: [routes.view5],
//                selection: $appState.moveTo) {
//
//                Button("Move to View5") {
//                    appState.moveTo?.append(.view5)
//                }
//            }
//            .isDetailLink(false)
//        }
//    }
//
//}
//
//
//struct View5: View {
//    @EnvironmentObject var appState: AppState
//
//    var body: some View {
//
//        VStack {
//            Text("View5")
//                .font(.headline)
//            Button {
//                withAnimation(.easeInOut(duration: 1)) {
//                    appState.moveToDashboard()
//                }
//            } label: {
//                Text("Move to Dash")
//                    .font(.headline)
//            }
//
//            Button {
//                appState.moveFrom5To3()
//            } label: {
//                Text("Move to view3")
//                    .font(.headline)
//            }
//
//
//        }
//
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
