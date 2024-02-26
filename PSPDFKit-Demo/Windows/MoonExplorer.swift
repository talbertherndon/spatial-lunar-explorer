//
//  ResourcePanel.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/23/24.
//

import SwiftUI
import RealityKit

struct MoonExplorer: View {
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    @State var isPressed = false
    @State var immersiveSpaceIsVisible = false
    @State var terrainVisible = false
    @State var mineralVisible = false

    @Environment(ViewModel.self) private var model
    let items: [ListItem] = [
        ListItem(title: "Moon LRO LOLA - SELENE Kaguya TC DEM Merge 60N60S 59m v1", description: "The Lunar Orbiter Laser Altimeter (LOLA) and SELenological and Engineering Explorer (SELENE) Kaguya Teams have created an improved lunar digital elevation model (DEM) covering latitudes within ±60°, at a horizontal resolution of 512 pixels per degree (~59 meters per pixel [m] at the equator) and a typical vertical accuracy ~3 to 4 m. This DEM is constructed from ~4.5×109 geodetically-accurate topographic heights from the LOLA, to which we co-registered 43,200 stereo-derived DEMs (each 1°×1°) from the TC (~1010 pixels total). After co-registration, approximately 90% of the TC DEMs show root-mean-square vertical residuals with the LOLA data of <5 m compared to ~50% prior to co-registration. We use the co-registered TC data to estimate and correct orbital and pointing geolocation errors from the LOLA altimetric profiles (typically amounting to <10 m horizontally and <1 m vertically). By combining both co-registered datasets, we obtain a near-global DEM with high geodetic accuracy and without the need for surface interpolation. We evaluate the resulting LOLA + TC merged DEM (designated as “SLDEM2015”) with particular attention to quantifying seams and crossover errors. Map values are referred to a radius of 1,737,400 m.", source: "Artemis Accords"),
    ]
    let terrain: [ListItem] = [
        ListItem(title: "Moon LRO LOLA Color Shaded Relief 388m v4", description: "This is a colorized shaded-relief of a original polar digital elevation model (DEM) from the Lunar Orbiter Laser Altimeter (LOLA; Smith et al., 2010), an instrument on the National Aeronautics and Space Agency (NASA) Lunar Reconnaissance Orbiter (LRO) spacecraft (Tooley et al., 2010). The DEM is a shape map (radius) of the Moon at a resolution 100 meters per pixel (m) based on altimetry data acquired through September, 2011 by the LOLA instrument. The ground tracks were interpolated using the Generic Mapping Tools programs `surface` and `grdblend`. Map values are referred to a radius of 1,737,400 m.", source: "Artemis Accords"),
    ]
    
    let mineral: [ListItem] = [
        ListItem(title: "Moon Clementine UVVIS Warped Color Ratio Mosaic 200m v1", description: "This base represents the Clementine Ultraviolet/Visible (UVVIS) warped color-ratio mineral map. This was generated from the UVVIS mosaics using three spectral filters (415, 750, and 1000 nm) and which were previously warped (spatially adjusted) to the ULCN2005 control network. The mosaic is a composite in which the ratio of the 750/415nm bands is used for the red-channel brightness, 415/750nm for the blue channel, and the 750/1000nm ratio controls the green channel. Resolution of this mosaic is 200 meters per pixel (m). Color interpretations: The red channel represents areas that are low in titanium, or high in glass content, the green channel is sensitive to the amount of iron in the surface, and the blue channel reflects the surfaces with high titanium or bright slopes and albedos that are not compensated by using the image ratios. Lunar highlands appear red because they have accumulated glassy agglutinates produced during the bombardment of micrometeorites (maturation). Also red in the false-color image are pyroclastic deposits because of their naturally high-glass content. The yellow-green area in the mare is the combined effect of concentration of mafic minerals (green) and the glass in the soil produced by maturation (red). The blue unit in the mare is relatively higher in titanium compared to the mare unit to its immediate north.", source: "Artemis Accords"),
    ]
    
    func selectMarker(_ marker: Craters) {
        dismissWindow(id: "moon")
        print(marker.location)
        model.selectedMarker = marker
        openWindow(id:"moon")
    }
    
    
    var body: some View {
        NavigationSplitView {
            VStack{
                if terrainVisible == false && mineralVisible == false{
                    List(items, id: \.source) { item in
                        ListItemView(item: item)
                    }
                }
                if terrainVisible == true {
                    List(terrain, id: \.source) { item in
                        ListItemView(item: item)
                    }
                }
                if mineralVisible == true {
                    List(mineral, id: \.source) { item in
                        ListItemView(item: item)
                    }
                }
            }
            .navigationTitle("Lunar Explorer")
        } detail: {
            ZStack {
                if terrainVisible == false && mineralVisible == false{
                    Moon(
                        selectedMarker: model.selectedMarker,
                        onSelectMarker: selectMarker
                    )
                } else if mineralVisible == true {
                    MineralMoon()
                    
                } else if terrainVisible == true{
                    ElevatedMoon()
                }

                MoonControls(turnOnTerrainView: {
                    terrainVisible = true
                }, turnOffTerrainView: {
                    terrainVisible = false
                },turnOnMineralView:{
                    mineralVisible = true
                },turnOffMineralView: {
                    mineralVisible = false
                })
                    .offset(y: 150)
                
                
            }
        }
        .onChange(of: isPressed) { (_, new) in
            Task {
                if new {
                    openWindow(id:"moon")
                    immersiveSpaceIsVisible = true
                } else if immersiveSpaceIsVisible {
                     dismissWindow()
                }
            }
        }
        .onDisappear(perform: {
            dismissWindow(id: "moon")
        })

    }
    
}

#Preview {
    MoonExplorer()
        .environment(ViewModel())
        .previewLayout(.fixed(width: 300, height: 600))
}

