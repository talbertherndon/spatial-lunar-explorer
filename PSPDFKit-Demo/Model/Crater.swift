//
//  ContentView.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/23/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct MarkerItem: Identifiable, Equatable {
    var id: String
    var name: String
    var location: SIMD3<Float>
    var source: String
    var type: String?
}

private struct ItemView: View {
    var item: Craters
    var orientation: SIMD3<Double> = .zero
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    
    var body: some View {
        Model3D(named: item.source, bundle: realityKitContentBundle) { model in
            model.resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1)
//                .phaseAnimator([false, true]) { AirPodsMax, threeDYRotate in
//                        AirPodsMax
//                            .rotation3DEffect(.degrees(threeDYRotate ? 0 : -360 * 5), axis: (x: 0, y: 1, z: 0))
//                    } animation: { threeDYRotate in
//                            .linear(duration: 10).speed(0.03).repeatForever(autoreverses: false)
//                    }
                .accessibilitySortPriority(1)
        } placeholder: {
            ProgressView()
        }
        .dragRotation(
            axRotateClockwise: axRotateClockwise,
            axRotateCounterClockwise: axRotateCounterClockwise)
    }
}



struct Crater: View {
    @Environment(ViewModel.self) private var model
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false

    var body: some View {
        ZStack{
            Model3D(named:  model.selectedMarker.source, bundle: realityKitContentBundle) { model in
                model.resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(1)
    //                .phaseAnimator([false, true]) { AirPodsMax, threeDYRotate in
    //                        AirPodsMax
    //                            .rotation3DEffect(.degrees(threeDYRotate ? 0 : -360 * 5), axis: (x: 0, y: 1, z: 0))
    //                    } animation: { threeDYRotate in
    //                            .linear(duration: 10).speed(0.03).repeatForever(autoreverses: false)
    //                    }
                    .accessibilitySortPriority(1)
            } placeholder: {
                ProgressView()
            }
            .dragRotation(
                axRotateClockwise: axRotateClockwise,
                axRotateCounterClockwise: axRotateCounterClockwise)
            
            CraterDetails(title: model.selectedMarker.title, text: model.selectedMarker.description, author: model.selectedMarker.author)
                .offset(x:300, y:150)
            
        }

    }
    
}

#Preview {
    Crater()
        .environment(ViewModel())
        .previewLayout(.sizeThatFits)
}
