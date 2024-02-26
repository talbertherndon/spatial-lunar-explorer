//
//  ViewModel.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/22/24.
//

import Foundation

@Observable
class ViewModel: ObservableObject {
   // var navigationPath : [Area] = []
    var isShowingModel: Bool = false
    var selectedMarker: Craters = .petavius
    var selectedMission: Missions = .intuitve_machines
}


