//
//  ImmersiveView.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent




private struct MissionView: View {
    var marker: Missions
    @State private var selectedMarker: Missions?
    var onSelectMarker: (Missions) -> Void
    var body: some View {
        Text(marker.name)
        ZStack{
            Circle()
                .fill(Color.purple)
                .opacity(0.3)
                .frame(width: 30, height: 30)
            Circle()
                .fill(Color.purple)
                .opacity(0.7)
                .frame(width:20, height:20)
                .onTapGesture {
                    onSelectMarker(marker)
                    // Now you can modify marker's properties because it's a binding
                }
                .hoverEffect(.lift)
        }
    }
}

struct MissionMoon: View {
    var scale: Float = 0.5
    
    var position: SIMD3<Float> = .zero
    let moonRadius: Float = 100.0 // Example radius, adjust to your globe's size
    var orientation: SIMD3<Double> = .zero
    @State var moon = Entity()
    @State var CraterEntity = Entity()
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
//    @State private var audioController: AudioPlaybackController?

    @Environment(ViewModel.self) private var model

    
    let markers: [Missions] = Missions.allCases
    
    func onSelectMarker(_ marker: Missions) {
        print(marker.location)
        model.selectedMission = marker
    }
    
    var body: some View {
        
        HStack{
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
//                moon.position = [0,0,0]
                
                // rotation does not work with markers
//                if var rotation: RotationComponent = moon.components[RotationComponent.self] {
//                    rotation.speed = 0.1
//                    moon.components[RotationComponent.self] = rotation
//                } else {
//                    moon.components.set(RotationComponent(speed: 0.1))
//                }
                    
                    content.add(moon)
            } update: { content, attachments in
                for mark in markers {
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
                ForEach(markers, id: \.id){ mark in
                    Attachment(id: mark.id ){
                        MissionView(marker: mark, onSelectMarker: onSelectMarker)
                        
                    }
                }
            }
            .gesture(SpatialTapGesture()
                .targetedToAnyEntity()
                .onEnded {value in
                    let location = value.location3D
                    let convertedLocaiton = 1.01 * value.convert(location, from: .local, to: .scene)
                    print(convertedLocaiton)
//                    markers.append(Missions(id:"\(convertedLocaiton)", name: "Mission", location: convertedLocaiton, source: "Mission"))
                })
            .dragRotation(
                axRotateClockwise: axRotateClockwise,
                axRotateCounterClockwise: axRotateCounterClockwise)
        }
        
            MissionDetails(mission: model.selectedMission)
                .frame(width: 900, height: 800)
                .offset(z: 700)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
            
        }
    }
}

#Preview {
    MissionMoon()
        .environment(ViewModel())
        .previewLayout(.sizeThatFits)
}
