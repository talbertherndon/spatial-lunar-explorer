//
//  RotationSystem.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/19/24.
//

import SwiftUI
import RealityKit

/// Rotation information for an entity.
struct RotationComponent: Component {
    var speed: Float
    var axis: SIMD3<Float>

    init(speed: Float = 1.0, axis: SIMD3<Float> = [0, 1, 0]) {
        self.speed = speed
        self.axis = axis
    }
}

/// A system that rotates entities with a rotation component.
struct RotationSystem: System {
    static let query = EntityQuery(where: .has(RotationComponent.self))

    init(scene: RealityKit.Scene) {}

    func update(context: SceneUpdateContext) {
        for entity in context.entities(matching: Self.query, updatingSystemWhen: .rendering) {
            guard let component: RotationComponent = entity.components[RotationComponent.self] else { continue }
            entity.setOrientation(.init(angle: component.speed * Float(context.deltaTime), axis: component.axis), relativeTo: entity)
        }
    }
}

