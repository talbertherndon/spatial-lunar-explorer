//
//  ImmersiveView.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent



struct ElevatedMoon: View {
    let moonRadius: Float = 100.0 // Example radius, adjust to your globe's size
    var orientation: SIMD3<Double> = .zero
    @State var moon = Entity()
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    var body: some View {
        GeometryReader3D{ geometry in
            RealityView { content in
                let moon = moon
                moon.components.set(InputTargetComponent())
                moon.components.set(CollisionComponent(shapes: [ShapeResource.generateSphere(radius: moonRadius)]))
                guard let moon = try? await Entity(named:"ElevationMoon", in:realityKitContentBundle) else {
                    fatalError("Unable to load immersive model")
                }
                let bounds = content.convert(geometry.frame(in: .local), from: .local, to: content)
                
                let minExtent  = bounds.extents.min()
                moon.scale = [minExtent, minExtent, minExtent]
                moon.position = [0,0,0]
                content.add(moon)
            }
            placeholder : {
                ProgressView()
                    .progressViewStyle(.circular)
                    .controlSize(.large)
            }
            .gesture(SpatialTapGesture()
                .targetedToAnyEntity()
                .onEnded {value in
                    let location = value.location3D
                    let convertedLocaiton = 1.01 * value.convert(location, from: .local, to: .scene)
                    print(convertedLocaiton)                    
                })
            .dragRotation(
                axRotateClockwise: axRotateClockwise,
                axRotateCounterClockwise: axRotateCounterClockwise)

        }
        

    }
    
}

