
//
//  ContentView.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import PSPDFKit
import PSPDFKitUI
import Combine

private let modelDepth: Double = 100

struct ListItem {
    let title: String
    let description: String
    let source: String
}

private struct ItemView: View {
    var orientation: SIMD3<Double> = .zero
    var source : String
    @State private var selectedItem: ListItem? = nil

    
    var body: some View {
            Model3D(named: source, bundle: realityKitContentBundle) { model in
                model.resizable()
                    .scaledToFit()
                    .rotation3DEffect(
                        Rotation3D(
                            eulerAngles: .init(angles: orientation, order: .xyz)
                        )
                    )
                    .frame(depth: modelDepth)
                    .offset(z: -modelDepth / 2)
                    .accessibilitySortPriority(1)
            } placeholder: {
                ProgressView()
                    .offset(z: -modelDepth * 0.75)
            }
    }
}

private struct PDFView: UIViewControllerRepresentable {
    var document: Document
    func makeUIViewController(context: Context) -> PDFViewController {
        let pdfViewController = PDFViewController(document: document) {
            $0.isPageLabelEnabled = false
        }
        return pdfViewController
    }
    func updateUIViewController(_ uiViewController: PDFViewController, context: Context) {
        // Update the view controller if needed.
    }
    
}


struct DocumentsWindow: View {
    @Environment(ViewModel.self) private var model

    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    
    @State private var selectedItem: ListItem? = nil
    @State private var selectedAsset: ListItem? = nil

    @State private var selectedTab: Int = 0

    let items: [ListItem] = [
        ListItem(title: "Artemis Accords", description: "Principles for Cooperation in the Civil Exploration and Use of the Moon, Mars, Comets, and Asteroids for Peaceful Purposes. The Artemis Accords focus on promoting peaceful and collaborative exploration of outer space, emphasizing the importance of transparency, interoperability, and sustainability in space activities.", source: "Artemis Accords"),
        ListItem(title: "Moon Treaty", description: "An agreement Governing the Activities of States on the Moon and Other Celestial Bodies. The Moon Treaty addresses issues such as the sharing of benefits from space exploration, the prohibition of weapons of mass destruction in space, and the need for international cooperation in space activities.", source: "Moon Treaty"),
        ListItem(title: "Recommended Framework for Lunar Activities", description: "Recommended Framework and Key Elements for Peaceful and Sustainable Lunar Activities. This framework provides guidelines for conducting lunar activities in a sustainable and responsible manner, taking into account environmental protection and the preservation of historical sites on the moon.", source: "Recommended Framework and Key Elements for Peaceful and Sustainable Lunar Activities"),
        ListItem(title: "Declaration of Legal Principles Governing the Activities of States in the Exploration and Uses of Outer Space", description: "This declaration outlines legal principles governing the exploration and use of outer space by states. It provides guidelines and standards for the conduct of space activities, addressing issues such as sovereignty, non-interference, and cooperation among states in the peaceful exploration and utilization of outer space resources.", source: "Declaration on International Cooperation"),
         ListItem(title: "Space Liability Convention", description: "The Space Liability Convention establishes the liability of launching states for damage caused by their space objects. It outlines the responsibilities of states in the event of accidents or collisions involving space objects, ensuring that parties are held accountable for their activities in space.", source: "Space Liability Convention"),
         ListItem(title: "Space Debris Mitigation Guidelines of the Committee on the Peaceful Uses of Outer Space", description: "These guidelines provide recommendations for mitigating and reducing the creation of space debris. They aim to promote responsible space operations and minimize the risks posed by space debris to operational spacecraft and satellites in Earth's orbit.", source: "Space Debris Mitigation Guidelines of the Committee on the Peaceful Uses of Outer Space"),
         ListItem(title: "Safety Framework for Nuclear Power Source Applications in Outer Space", description: "This safety framework establishes guidelines for the use of nuclear power sources in outer space missions. It outlines safety measures and protocols to ensure the safe and responsible utilization of nuclear power sources in space exploration.", source: "Safety Framework for Nuclear Power Source Applications in Outer Space"),
         ListItem(title: "Rescue Agreement", description: "The Rescue Agreement establishes protocols for the rescue and assistance of astronauts in distress. It ensures that parties to the agreement cooperate in providing assistance to astronauts in emergency situations, promoting the safety and well-being of individuals in space.", source: "Rescue Agreement"),
         ListItem(title: "Remote Sensing Principles", description: "These principles govern the use of remote sensing technologies in space activities. They outline guidelines for conducting remote sensing operations, ensuring the responsible and ethical use of data gathered from space-based sensors.", source: "Remote Sensing Principles"),
         ListItem(title: "Registration Convention", description: "The Registration Convention requires states to register their space objects with the United Nations. This helps ensure transparency and accountability in space activities, facilitating cooperation and coordination among states in managing the use of outer space.", source: "Registration Convention"),
         ListItem(title: "Recommendations on national legislation relevant to the peaceful exploration and use of outer space", description: "These recommendations provide guidelines for national legislation related to space activities. They aim to harmonize legal frameworks among states, promoting international cooperation and coordination in the peaceful exploration and use of outer space.", source: "Recommendations on national legislation"),
         ListItem(title: "Recommendations on enhancing the practice of States and international intergovernmental organizations in registering space objects", description: "These recommendations aim to improve the registration practices of states and international organizations for space objects. They promote transparency and accountability in space activities, facilitating the coordination and management of space assets in Earth's orbit.", source: "Recommendations for organizations in registering space objects"),
         ListItem(title: "Principles Relevant to the Use of Nuclear Power Sources In Outer Space", description: "These principles provide guidelines for the use of nuclear power sources in outer space missions. They address safety, security, and environmental considerations in the deployment and operation of nuclear power systems in space exploration.", source: "Principles Relevant to the Use of Nuclear Power Sources In Outer Space"),
         ListItem(title: "Principles Governing the Use by States of Artificial Earth Satellites for International Direct Television Broadcasting", description: "These principles govern the use of artificial Earth satellites for international direct television broadcasting. They outline guidelines for the deployment and operation of satellite systems for broadcasting purposes, ensuring the responsible and ethical use of space-based communication technologies.", source: "Principles Governing the Use by States of Artificial Earth Satellites for International Direct Television Broadcasting"),
         ListItem(title: "Outer Space Treaty", description: "The Outer Space Treaty is a foundational international agreement that establishes the principles of peaceful uses of outer space. It prohibits the placement of nuclear weapons in space, establishes freedom of exploration and use of outer space for all countries, and promotes international cooperation in space activities.", source: "Outer Space Treaty"),
        ListItem(title: "Moon Agreement", description: "The Moon Agreement builds upon the principles of the Outer Space Treaty, focusing specifically on the Moon and other celestial bodies. It outlines guidelines for the peaceful use and exploration of the Moon, promoting the equitable sharing of resources and benefits derived from lunar activities.", source: "Moon Agreement"),
        ListItem(title: "Law of July 20th 2017 on the exploration and use of space resources - The agency - Luxembourg Space Agency", description: "This law regulates the exploration and use of space resources, particularly in relation to the activities of the Luxembourg Space Agency. It sets out legal frameworks for private companies and organizations engaged in space resource utilization, promoting investment and innovation in the space sector.", source: "Law Luxembourg Space Agency"),
        ListItem(title: "International co-operation in the peaceful uses of outer space", description: "This document promotes international cooperation in space activities for peaceful purposes. It emphasizes the benefits of collaboration and coordination among countries in space exploration, research, and technology development.", source: "International co-operation in the peaceful uses of outer space"),
        ListItem(title: "Guidelines for the long-term sustainability of outer space activities of the committee on the peaceful uses of outer space", description: "These guidelines aim to ensure the long-term sustainability of outer space activities. They address issues such as space debris mitigation, orbital congestion, and environmental protection, promoting responsible and sustainable practices in space exploration and utilization.", source: "Guidelines for space activities"),
        ListItem(title: "Declaration on International Cooperation in the Exploration and Use of Outer Space for the Benefit and in the Interest of All States, Taking into Particular Account the Needs of Developing Countries", description: "This declaration underscores the importance of international cooperation in space exploration for the benefit of all countries. It recognizes the specific needs of developing nations and calls for inclusive and equitable participation in space activities.", source: "Declaration on International Cooperation"),
        ListItem(title: "Application of the concept of the “launching State”", description: "This concept defines the legal responsibility of states for activities conducted in outer space. It establishes the obligations and liabilities of the launching state for space objects launched from its territory, ensuring accountability for space missions and operations.", source: "Application"),
        ListItem(title: "Working Group on Legal Aspects of Space Resource Activities - Status Overview", description: "This overview provides insights into the legal aspects of space resource activities. It outlines the current status of international discussions and efforts to regulate and govern the exploration and utilization of space resources, addressing key legal challenges and opportunities in this emerging field.", source: "Working Group on Legal Aspects of Space Resource Activities - Status Overview"),
        ListItem(title: "Vancouver Recommendations on Space Mining", description: "The Vancouver Recommendations provide guidelines for the responsible and sustainable development of space mining activities. They address legal, regulatory, and environmental considerations in space resource extraction, promoting the safe and ethical exploitation of resources from celestial bodies.", source: "Vancouver Recommendations on Space Mining"),
        ListItem(title: "U.S. Commercial Space Launch Competitiveness Act", description: "This act promotes commercial space activities and innovation in the United States. It establishes frameworks for licensing and regulating commercial space launches, encouraging private sector investment and participation in space exploration.", source: "U.S. Commercial Space Launch Competitiveness Act"),
        ListItem(title: "Japanese Information to the Space Resources Working Group", description: "This information provides insights from Japan on space resource activities. It highlights Japan's perspectives and contributions to international discussions on the exploration and utilization of space resources, showcasing the country's interests and capabilities in this field.", source: "Japanese Information to the Space Resources Working Group"),
        ListItem(title: "Federal Law No 12 of 2019 On The Regulation of the Space Sector", description: "This federal law regulates the space sector in a specific country or region. It outlines legal frameworks for space activities, including licensing, registration, and oversight of space operations, promoting the development and growth of the space industry within the jurisdiction.", source: "Federal Space"),
        ListItem(title: "Best Practices for Sustainable Lunar Activities", description: "These best practices outline guidelines for conducting sustainable activities on the Moon. They address environmental protection, resource utilization, and historic preservation on the lunar surface, promoting responsible and sustainable practices in lunar exploration and development.", source: "Best Practices for Sustainable Lunar Activities"),
        ListItem(title: "Regulatory Framework on Space Activities of the United Arab Emirates", description: "This regulatory framework governs space activities in the United Arab Emirates. It establishes legal requirements and guidelines for space operations, promoting innovation, investment, and collaboration in the space sector within the country.", source: "Regulatory Framework on Space Activities of the United Arab Emirates"),
        ListItem(title: "Building Blocks Outer Space", description: "These building blocks represent fundamental elements of space activities. They include legal principles, guidelines, and agreements that form the foundation for peaceful, sustainable, and responsible exploration and use of outer space, ensuring the long-term viability and success of human activities beyond Earth.", source: "Building Blocks Outer Space")
    ]


    
    var body: some View {
        @Bindable var model = model
        NavigationSplitView {
            List(items, id: \.source) { item in
                    ListItemView(item: item)
                        .hoverEffect(.automatic)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
                .navigationTitle("Documents")

        } detail: {
            if let selectedItem = selectedItem {
                let fileURL = Bundle.main.url(forResource: selectedItem.source, withExtension: "pdf")!
                let document = Document(url:fileURL)
                Text("\(selectedItem.title)")
                PDFView(document: document)
                     .frame(width: 400, height: 600)
                     .id(selectedItem.source)
                
            } else {
                Text("Select an item")
            }
        }.onAppear(perform: {
            openWindow(id: "mission_moon")
        })
        .onDisappear(perform: {
            dismissWindow(id:"mission_moon")
        })
    }
}


#Preview{
    DocumentsWindow()
        .environment(ViewModel())
}


