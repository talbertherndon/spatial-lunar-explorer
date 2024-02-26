//
//  ImmersiveView.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent




struct MarkerView: View {
    var marker: Craters
    @State var selectedMarker: Craters?
    var onSelectMarker: (Craters) -> Void
    var body: some View {
        VStack {
            Text(marker.source)
            ZStack{
                Circle()
                    .fill(marker.type == "crater" ? Color.red: Color.gray)
                    .opacity(0.3)
                    .frame(width: marker.type == "crater" ? 25 : 50, height: marker.type == "crater" ? 25 : 50)
                Circle()
                    .fill(marker.type == "crater" ? Color.red: Color.gray)
                    .opacity(0.7)
                    .frame(width: marker.type == "crater" ? 15 : 30, height: marker.type == "crater" ? 15 : 30)
                    .onTapGesture {
                        onSelectMarker(marker)
                        // Now you can modify marker's properties because it's a binding
                    }
                    .hoverEffect(.lift)
            }

        }
    }
}

struct Moon: View {
    var selectedMarker: Craters?
    let moonRadius: Float = 100.0 // Example radius, adjust to your globe's size
    var orientation: SIMD3<Double> = .zero
    @State var moon = Entity()
    @State var CraterEntity = Entity()
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    @State private var audioController: AudioPlaybackController?

    var onSelectMarker: (Craters) -> Void

    let markers: [Craters] = Craters.allCases


    var body: some View {
        GeometryReader3D{ geometry in
            RealityView { content, attachments  in
                let moon = moon
                moon.components.set(InputTargetComponent())
                moon.components.set(CollisionComponent(shapes: [ShapeResource.generateSphere(radius: moonRadius)]))
                guard let moon = try? await Entity(named:"Scene", in:realityKitContentBundle) else {
                    fatalError("Unable to load immersive model")
                }
                let bounds = content.convert(geometry.frame(in: .local), from: .local, to: content)
                
                let minExtent  = bounds.extents.min()
                moon.scale = [minExtent, minExtent, minExtent]
                moon.position = [0,0,0]
                let ambientAudioEntity = moon.findEntity(named: "AmbientAudio")
                
                guard let resource = try? await AudioFileResource(named: "/Root/Heaven_mp3", from: "Scene.usda", in: realityKitContentBundle) else {
                    fatalError("Unable to load heaven.mp3 audio resource")
                }
                audioController = ambientAudioEntity?.prepareAudio(resource)
                audioController?.play()
                
                content.add(moon)
            } update: { content, attachments in
                for mark in Craters.allCases  {
                    if let markEntity = attachments.entity(for: mark.id) {
                        content.add(markEntity)
                        markEntity.look(at: .zero, from: mark.location, relativeTo: markEntity.parent)
                    }
                    
                }
            }
            placeholder : {
                ProgressView()
                    .progressViewStyle(.circular)
                    .controlSize(.large)
            } attachments: {
                ForEach(Craters.allCases, id: \.id){ mark in
                    Attachment(id: mark.id ){
                        MarkerView(marker: mark, onSelectMarker: onSelectMarker)
                    }
                }
            }
            .gesture(SpatialTapGesture()
                .targetedToAnyEntity()
                .onEnded {value in
                    let location = value.location3D
                    let convertedLocaiton = 1.01 * value.convert(location, from: .local, to: .scene)
                    print(convertedLocaiton)
//                    markers.append(MarkerItem(id:"\(convertedLocaiton)", name: "Crater", location: convertedLocaiton, source: "Gagarin"))
                    // need to add this to state
//                    Craters.addNewItem(named: "newItem", location: convertedLocaiton, source: "Langrenus")
                    print(markers)
//                    print("CUstom:",Item.customItems)

                    
                })
            .dragRotation(
                axRotateClockwise: axRotateClockwise,
                axRotateCounterClockwise: axRotateCounterClockwise)

        }
        

    }
    
}

