//
//  backportarray.swift
//  navigationpoc
//
//  Created by Lucas Barroso IZ on 06/01/2023.
//

import SwiftUI
import NavigationBackport

enum Screen: NBScreen {
    case View1
    case View2
    case View3
}

struct ArrayBindingView: View {
    @State var savedPath: [Screen]?
    @State var path: [Screen] = []
    
    
    
    var body: some View {
      VStack {
        HStack {
          Button("Save", action: savePath)
            .disabled(savedPath == path)
          Button("Restore", action: restorePath)
            .disabled(savedPath == nil)
        }
        NBNavigationStack(path: $path) {
          HomeViewBackPort()
            .nbNavigationDestination(for: Screen.self, destination: { screen in
              switch screen {
              case .View1:
                  View1BackPort()
              case .View2:
                  View2BackPort()
              case .View3:
                  View3BackPort()
              }
            })
        }
      }
    }
    
    func savePath() {
        savedPath = path
      }

      func restorePath() {
        guard let savedPath = savedPath else { return }
        $path.withDelaysIfUnsupported {
          $0 = savedPath
        }
      }
}

private struct HomeViewBackPort: View {
  @EnvironmentObject var navigator: Navigator<Screen>

  var body: some View {
    VStack(spacing: 8) {
     
      // Push via navigator
        Button("Go to View1", action: { navigator.push(.View1) })
      // Push via Bool binding
     
    }.navigationTitle("Home")
      
  }
}

private struct View1BackPort: View {
  @EnvironmentObject var navigator: Navigator<Screen>

  var body: some View {
    VStack(spacing: 8) {
     
      // Push via navigator
        Button("Go to View2", action: { navigator.push(.View2) })
      // Push via Bool binding
     
    }.navigationTitle("View1")
      
  }
}

private struct View2BackPort: View {
  @EnvironmentObject var navigator: Navigator<Screen>

  var body: some View {
    VStack(spacing: 8) {
     
      // Push via navigator
        Button("Go to View3", action: { navigator.push(.View3) })
      // Push via Bool binding
     
    }.navigationTitle("View2")
      
  }
}

private struct View3BackPort: View {
  @EnvironmentObject var navigator: Navigator<Screen>

  var body: some View {
    VStack(spacing: 8) {
     
      // Push via navigator
        Button("Back to Home", action: { navigator.popToRoot() })
        Button("Back to View1", action: { navigator.popTo(.View1) })
            .padding(.all, 20)
      
     
    }.navigationTitle("View3")
      
  }
}
