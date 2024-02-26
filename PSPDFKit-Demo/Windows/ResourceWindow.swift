
//
//  ContentView.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import PSPDFKit
import PSPDFKitUI
import Combine

private let modelDepth: Double = 100

struct ListItem {
    let title: String
    let description: String
    let source: String
}

private struct ItemView: View {
    var orientation: SIMD3<Double> = .zero
    var source : String
    @State private var selectedItem: ListItem? = nil

    
    var body: some View {
            Model3D(named: source, bundle: realityKitContentBundle) { model in
                model.resizable()
                    .scaledToFit()
                    .rotation3DEffect(
                        Rotation3D(
                            eulerAngles: .init(angles: orientation, order: .xyz)
                        )
                    )
                    .frame(depth: modelDepth)
                    .offset(z: -modelDepth / 2)
                    .accessibilitySortPriority(1)
            } placeholder: {
                ProgressView()
                    .offset(z: -modelDepth * 0.75)
            }
    }
}

private struct PDFView: UIViewControllerRepresentable {
    var document: Document
    func makeUIViewController(context: Context) -> PDFViewController {
        let pdfViewController = PDFViewController(document: document) {
            $0.isPageLabelEnabled = false
        }
        return pdfViewController
    }
    func updateUIViewController(_ uiViewController: PDFViewController, context: Context) {
        // Update the view controller if needed.
    }
    
}


struct ResourceWindow: View {
    @Environment(ViewModel.self) private var model

    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    
    @State private var selectedItem: ListItem? = nil
    @State private var selectedAsset: ListItem? = nil

    @State private var selectedTab: Int = 0

    let items: [ListItem] = [
        ListItem(title: "Artemis Accords", description: "Principles for Cooperation in the Civil Exploration and Use of the Moon, Mars, Comets, and Asteroids for Peaceful Purposes", source: "Artemis Accords"),
        ListItem(title: "Moon Treaty", description: "Agreement Governing the Activities of States on the Moon and Other Celestial Bodies", source: "Moon Treaty"),
        ListItem(title: "Recommended Framework for Lunar Activities", description: "Recommended Framework and Key Elements for Peaceful and Sustainable Lunar Activities", source: "Recommended Framework and Key Elements for Peaceful and Sustainable Lunar Activities"),
        // Add more items as needed
    ]

    
    var body: some View {
        @Bindable var model = model
        NavigationSplitView {
            List(items, id: \.source) { item in
                    ListItemView(item: item)
                        .hoverEffect(.automatic)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
                .navigationTitle("Documents")

        } detail: {
            if let selectedItem = selectedItem {
                let fileURL = Bundle.main.url(forResource: selectedItem.source, withExtension: "pdf")!
                let document = Document(url:fileURL)
                Text("\(selectedItem.title)")
                PDFView(document: document)
                     .frame(width: 400, height: 600)
                     .id(selectedItem.source)
                
            } else {
                Text("Select an item")
            }
        }.onAppear(perform: {
            openWindow(id: "mission_moon")
        })
        .onDisappear(perform: {
            dismissWindow(id:"mission_moon")
        })
    }
}


#Preview{
    ResourceWindow()
        .environment(ViewModel())
}


