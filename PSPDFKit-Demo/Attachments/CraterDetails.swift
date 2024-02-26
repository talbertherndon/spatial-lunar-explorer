//
//  CraterDetails.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/25/24.
//


import SwiftUI

struct CraterDetails: View {
    @State private var orbitOn = false
    @State private var lightOn = false
    @State private var isShowing = false
    var title: String
    var text: String
    var author: String
    
    var body: some View {
        VStack {
            Button {
                isShowing.toggle()
            } label: {
                Label("Crater Details", systemImage:"gear")
            }
            .controlSize(.mini)
            .font(.system(size:10))
        }
        
        if isShowing {
            VStack{
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                    
                    
                Text(text)
                    .font(.system(size: 12))
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                Text(author)
                    .font(.system(size: 10))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .italic()
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))

            }
            .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
            .frame(width: 350)
            .glassBackgroundEffect()
        }
    }
}
