//
//  navigationstack.swift
//  navigationpoc
//
//  Created by Lucas Barroso IZ on 07/01/2023.
//

import SwiftUI
import NavigationStack

struct RootView: View {
    var body: some View {
        NavigationStackView {
            MyHome()
        }
    }
}

struct MyHome: View {
    var body: some View {
        VStack {
            PushView(destination: View1Stack()) {
                Text("Go to View1")
            }
        }
    }
}

struct View1Stack: View {
    var body: some View {
        VStack {
            PushView(destination: View2Stack()) {
                Text("Go to View2")
            }
        }
    }
}
struct View2Stack: View {
    var body: some View {
        VStack {
            PushView(destination: View3Stack()) {
                Text("Go to View3")
            }
        }
    }
}
struct View3Stack: View {
    var body: some View {
        VStack {
            PopView(destination: .root) {
                Text("Pop to root")
            }
        }
    }
}
