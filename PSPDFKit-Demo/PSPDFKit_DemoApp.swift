//
//  PSPDFKit_DemoApp.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/19/24.
//

import SwiftUI


@main
struct PSPDFKit_DemoApp: App {
    @State private var model = ViewModel()

    var body: some Scene {
        WindowGroup(id: "Resources") {
            TabView{
                MoonExplorer()
                    .environment(model)
                    .tabItem {
                    Label("Craters", systemImage: "moon.stars.circle")
                        }
                DocumentsWindow()
                    .environment(model)
                    .tabItem {
                    Label("Missions", systemImage: "book.circle.fill")
                        }
            }
            .frame(width: 1080,height: 720)

        }
        .windowResizability(.contentSize)
        
        WindowGroup(id: "moon"){
            Crater()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.7, height: 0.7, depth: 0.7, in: .meters)
        
        WindowGroup(id: "mission_moon"){
            MissionMoon()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 2, height: 1, depth: 1, in: .meters)
    }
    init() {
        RotationComponent.registerComponent()
        RotationSystem.registerSystem()
    }
}

