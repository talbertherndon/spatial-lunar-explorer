//
//  CraterDetails.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/25/24.
//


import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let data: [String: String]
 
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        var value = data["value"]
        print(value!)
        guard let demoURL = URL(string:value!) else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}

struct MissionDetails: View {
    @State private var orbitOn = false
    @State private var lightOn = false
    @State private var isShowing = false
    var mission: Missions

    var body: some View {
            VStack{
                Text(mission.name)
                    .font(.extraLargeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                ScrollView{
                    VStack{
                        ForEach(mission.sources, id:\.self) { data in
                            YouTubeView(data:data)
                                .frame(width: 700, height: 550)
                                .padding()
                            Text("\(data["description"]!)")
                                .font(.largeTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                        }
                        
                    }
                }

                Text(mission.description)
                    .font(.headline)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                
            }
            .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
            .glassBackgroundEffect()
            
        }
    }
