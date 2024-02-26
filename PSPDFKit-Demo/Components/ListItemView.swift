//
//  ListItemView.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/24/24.
//

import SwiftUI


struct ListItemView: View {
    var item: ListItem
    var isHovered: Bool = false
    var isSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)
                .lineLimit(2)
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

