//
//  uipilot.swift
//  navigationpoc
//
//  Created by Lucas Barroso IZ on 07/01/2023.
//

import SwiftUI
import UIPilot

enum AppRoute: Equatable {
    case Home
    case View1
    case View2
    case View3
}

struct UiPilot: View {
    @StateObject var pilot = UIPilot(initial: AppRoute.Home)
    
    var body: some View {
        
        UIPilotHost(pilot) { route in
            switch route {
            case .Home: Home()
            case .View1: View1()
            case .View2: View2()
            case .View3: View3()
            }
        }
        
    }
}

struct Home: View {
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View {
        VStack {
            Button("Go to View1", action: {
                pilot.push(.View1)    // Pass arguments
            })
        }.navigationTitle("Home")  // Set title using standard NavigationView APIs
    }
}

struct View1: View {
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View {
        VStack {
            Button("Go to View2", action: {
                pilot.push(.View2)    // Pass arguments
            })
        }.navigationTitle("View1")  // Set title using standard NavigationView APIs
    }
}

struct View2: View {
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View {
        VStack {
            Button("Go to View3", action: {
                pilot.push(.View3)    // Pass arguments
            })
        }.navigationTitle("View2")  // Set title using standard NavigationView APIs
    }
}

struct View3: View {
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Go to Home", action: {
                pilot.popTo(.Home)   // Pass arguments
            })
            
            Button("Go to View1", action: {
                pilot.popTo(.View1)   // Pass arguments
            })
        }.navigationTitle("View3")  // Set title using standard NavigationView APIs
    }
}
