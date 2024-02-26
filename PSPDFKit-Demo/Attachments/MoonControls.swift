//
//  CapsuleDetails.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/18/24.
//

import SwiftUI


struct MoonControls: View {
    @State private var terrainOn = false
    @State private var mineralOn = false
    @State private var isShowing = false
    
    let turnOnTerrainView: ()-> Void
    let turnOffTerrainView: ()-> Void
    let turnOnMineralView: ()-> Void
    let turnOffMineralView: ()-> Void
//
//    let turnOrbitOn: ()-> Void
//    let turnOrbitOff: ()-> Void
//microbe.circle.fill
//rotate.3d.circle.fill
//"mountain.2.circle.fill"
    func turnOff() {
        turnOffMineralView()
        turnOffTerrainView()
    }
    
    var body: some View {
            VStack{
                HStack(alignment: .top){
                    Toggle(isOn: $terrainOn) {
                        Label("Terrain", systemImage: "mountain.2.circle.fill")
                            .onChange(of: terrainOn, {
                                if terrainOn{
                                    turnOff()
                                    turnOnTerrainView()
                                }
                                else {
                                    turnOff()
                                }
                            })
                    }
                    Toggle(isOn: $mineralOn) {
                        Label("Mineral", systemImage: "microbe.circle.fill")
                            .onChange(of: mineralOn, {
                                if mineralOn{
                                    turnOff()
                                    turnOnMineralView()
                                }
                                else {
                                    turnOff()
                                }
                            })
                    }

                }
            }
            .toggleStyle(.button)
            .buttonStyle(.borderless)
            .labelStyle(.iconOnly)
            .padding(12)
            .glassBackgroundEffect(in: .rect(cornerRadius: 50))
            .alignmentGuide(.controlPanelGuide) { context in
                context[HorizontalAlignment.center]
            }
            .accessibilitySortPriority(2)
    }
}

extension HorizontalAlignment {
    /// A custom altargetedToEntityent to center the control panel under the globe.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    /// A custom alignment guide to center the control panel under the globe.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )
}
