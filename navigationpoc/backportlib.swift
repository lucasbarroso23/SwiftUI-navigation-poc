////
////  backportlib.swift
////  navigationpoc
////
////  Created by Lucas Barroso IZ on 06/01/2023.
////
//
//import NavigationBackport
//import SwiftUI
//
//struct BackPortView: View {
//  @State var path = NBNavigationPath()
//
//  var body: some View {
//    NBNavigationStack(path: $path) {
//      HomeView()
//        .nbNavigationDestination(for: NumberList.self, destination: { numberList in
//          NumberListView(numberList: numberList)
//        })
//        .nbNavigationDestination(for: Int.self, destination: { number in
//          NumberView(number: number, goBackToRoot: { path.popToRoot() })
//        })
//        .nbNavigationDestination(for: EmojiVisualisation.self, destination: { visualisation in
//          EmojiView(visualisation: visualisation)
//        })
//    }
//  }
//}
//
//struct HomeView: View {
//  var body: some View {
//    VStack(spacing: 8) {
//      NBNavigationLink(value: NumberList(range: 0 ..< 100), label: { Text("Pick a number") })
//    }.navigationTitle("Home")
//  }
//}
//
//struct NumberList: Hashable {
//  let range: Range<Int>
//}
//
//struct NumberListView: View {
//  let numberList: NumberList
//  var body: some View {
//    List {
//      ForEach(numberList.range, id: \.self) { number in
//        NBNavigationLink("\(number)", value: number)
//      }
//    }.navigationTitle("List")
//  }
//}
//
//struct NumberView: View {
//  let number: Int
//  let goBackToRoot: () -> Void
//
//  var body: some View {
//    VStack(spacing: 8) {
//      Text("\(number)")
//      NBNavigationLink(
//        value: number + 1,
//        label: { Text("Show next number") }
//      )
//      NBNavigationLink(
//        value: EmojiVisualisation(emoji: "🐑", count: number),
//        label: { Text("Visualise with sheep") }
//      )
//      Button("Go back to root", action: goBackToRoot)
//    }.navigationTitle("\(number)")
//  }
//}
//
//struct EmojiVisualisation: Hashable {
//  let emoji: String
//  let count: Int
//  
//  var text: String {
//    Array(repeating: emoji, count: count).joined()
//  }
//}
//
//struct EmojiView: View {
//  let visualisation: EmojiVisualisation
//
//  var body: some View {
//    Text(visualisation.text)
//      .navigationTitle("Visualise \(visualisation.count)")
//  }
//}
