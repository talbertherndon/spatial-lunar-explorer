//
//  Resource.swift
//  PSPDFKit-Demo
//
//  Created by Talbert Andre Herndon on 2/22/24.
//



import Foundation

enum Missions : String, CaseIterable, Identifiable,Equatable {
    case apollo_12, apollo_14, apollo_17,apollo_11,apollo_16, apollo_15, intuitve_machines
    var id: Self {self}
    var name: String{
        switch self {
        case .apollo_12:
            "Apollo 12"
        case .apollo_14:
            "Apollo 14"
        case .apollo_11:
            "Apollo 11"
        case .apollo_15:
            "Apollo 15"
        case .apollo_16:
            "Apollo 16"
        case .apollo_17:
            "Apollo 17"
        case .intuitve_machines:
            "IM-1"
        }
    }
    var location: SIMD3<Float> {
        switch self {
        case .apollo_12:
            SIMD3<Float>(-0.22830352, 0.0036493575, 0.4504342)
        case .apollo_14:
            SIMD3<Float>(-0.1392562, -0.06360273, 0.48123595)
        case .apollo_11:
            SIMD3<Float>(0.17810975, 0.011097676, 0.47241715)
        case .apollo_15:
            SIMD3<Float>(-0.010932845, 0.2648969, 0.4298103)
        case .apollo_16:
            SIMD3<Float>(0.12182193, -0.11320256, 0.47683322)
        case .apollo_17:
            SIMD3<Float>(0.22488214, 0.19208302, 0.40933707)
        case .intuitve_machines:
            SIMD3<Float>(0.05946287, -0.49503785, 0.08018777)
        }
    }

    var description: String{
        switch self {
        case .apollo_12:
            "Apollo 12"
        case .apollo_14:
            "Apollo 14"
        case .apollo_11:
            "Apollo 11"
        case .apollo_15:
            "Apollo 15"
        case .apollo_16:
            "Apollo 16"
        case .apollo_17:
            "Apollo 17"
        case .intuitve_machines:
            "Intuitive Machines 1 (IM-1) is a trailblazing mission aimed at creating a commercial lunar economy, delivering commercial payloads and NASA science and technology payloads that will pave the way for a sustainable human presence on and around the Moon. The mission aims to be the first U.S. vehicle to softly land on the lunar surface since Apollo 17 in 1972. "
        }
    }
    var sources: [[String: String]] {
        switch self {
        case .apollo_12:
            return [[
                "type": "youtube",
                "value": "https://www.youtube.com/embed/l11sW5KOi_g?si=XZmt6X-knQyHqNgC",
                "description":"Apollo 12 launched from Cape Kennedy on Nov. 14, 1969, into a cloudy, rain-swept sky. Launch controllers lost telemetry contact at 36 seconds, and again at 52 seconds, when the Saturn V launch vehicle was struck by lightning. In addition to continuing Apollo's lunar exploration tasks, Charles Conrad, Alan Bean, and Richard Gordon deployed the Apollo Lunar Surface Experiments Package, a set of investigations left on the Moon's surface to gather data."]]
        case .apollo_14:
            return [["type": "youtube", "value": "https://www.youtube.com/embed/l7MMTm1-DAA?si=NRrdvpoxGuwd5ZGG","description":"Apollo 14 was the eighth crewed Apollo mission and the third to land on the Moon. On January 31, 1971, Apollo 14 launched from Kennedy Space Center with a crew of commander Alan B. Shepard, command module pilot Stuart A. Roosa, and lunar module pilot Edgar D. Mitchell. The crew experienced challenges in docking with the lunar module Antares and six attempts were required before a `hard dock` was achieved. On February 5, 1971, Antares made the most precise landing to date in the hilly uplands of the Fra Mauro crater. Shepard and Mitchell spent a total of 33.5 hours on the Moon and performed two extra-vehicular activities (EVAs, or “moonwalks”), totaling 9 hours and 23 minutes. During the first EVA, they deployed several science experiments. Among these was a reflector that continues to be used to measure the distance from the Earth to the Moon. They also deployed a seismometer, which detected thousands of moonquakes and helped to determine the structure of the Moon’s interior. Other instruments measured the composition of the solar wind and the Moon’s tenuous atmosphere and plasma environment. Shepard and Mitchell collected 95 pounds of lunar rock and soil samples. The command module Kitty Hawk splashed down safely on February 9, 1971, exactly nine days and two minutes after launch. The mission duration from liftoff to splashdown was 216 hours, two minutes."]]
        case .apollo_11:
            return [["type": "youtube", "value": "https://www.youtube.com/embed/nOcDftgR5UQ?si=acz4z9DN8DFftLx0","description":"On July 20, 1969, humans walked on another world for the first time in history, achieving the goal that President John F. Kennedy had set in 1961, before Americans had even orbited the Earth. After a landing that included dodging a lunar crater and boulder field just before touchdown, Apollo 11 astronauts Neil Armstrong and Buzz Aldrin explored the area around their lunar landing site for more than two hours. When the lunar module landed at 4:17 p.m EDT, only 30 seconds of fuel remained. Armstrong radioed `Houston, Tranquility Base here. The Eagle has landed.` Mission control erupted in celebration as the tension breaks, and a controller tells the crew `You got a bunch of guys about to turn blue, we're breathing again.`"]]
        case .apollo_15:
            return [["type": "youtube", 
                     "value": "https://www.youtube.com/embed/1Mqsd0ru_pc?si=MKFOjGVK3kpAohTa",
                     "description":"Our first wheels on the Moon. On the Apollo 15 mission, the Lunar Roving Vehicle allowed the astronauts to cover a much greater distance on the Moon than the previous three flights had accomplished. This year marks the 50th anniversary of the Apollo 15 mission. On July 26, 1971, David R. Scott (Commander), James B. Irwin (Lunar Module Pilot) and Alfred M. Worden (Command Module Pilot) launched from Kennedy Space Center’s Launch Complex 39A. Apollo 15 set several new records for crewed spaceflight: heaviest payload in a lunar orbit of approximately 107,000 pounds, maximum radial distance traveled on the lunar surface away from the spacecraft of about 17.5 miles, most lunar surface moonwalks (three) and longest total of duration for lunar surface moonwalk (18 hours, 37 minutes), longest time in lunar orbit (about 145 hours), longest crewed lunar mission (295 hours), longest Apollo mission, the first satellite placed in lunar orbit by a crewed spacecraft, and first deep space and operational spacewalk."]]
        case .apollo_16:
            return [[
                "type": "youtube",
                "value": "https://www.youtube.com/embed/g5aPoRtF2vw?si=zDeE5kHc07Yxx8YR",
                "description":"Astronaut John Young jumps off the lunar surface to salute the American flag during the Apollo 16 mission in 1972. Crewmate Charlie Duke is the photographer."]]
        case .apollo_17:
            return [[
                "type": "youtube",
                "value": "https://www.youtube.com/embed/9HQfauGJaTs?si=6EELFcZRGUEzzvun",
                "description":"Lift-off of Apollo 17 Lunar Module ascent stage is captured by a television camera mounted on the lunar rover which the crew parked about 145 meters east of the spacecraft. The ascent stage ignites and climbs, spacecraft foil and dust fly in all directions. Ed Fendell in Houston had to anticipate the timing of ignition, lift-off, and the rate of climb, to control the camera tilt to follow the ascent. `We're on our way Houston` is the voice of Apollo 17 Commander Eugene Cernan.  The clip ends as LM `Challenger` reaches an altitude of 1,500 feet.  After docking with the Command Module, the ascent stage was jettisoned and returned to the lunar surface. Its impact was recorded by four geophones deployed by Apollo 17 astronauts, and by each ALSEP at the Apollo 12, 14, 15 and 16 landing sites."]]
        case .intuitve_machines:
            return [[
                "type":"yotube",
                "value":"https://www.youtube.com/embed/5-qwhozfYeQ?si=aIvDtmtLcagB27s_",
                "description":"For more information please visit our web page at https://www.intuitivemachines.com/im-1"
                    ],
                    [
                     "type": "youtube",
                     "value": "https://www.youtube.com/embed/aMhXHPynk-g?si=OKZdKo5hQ6kOun-0",
                     "description":"An American company has made history by becoming the first commercial outfit to put a spacecraft on the Moon. Houston-based Intuitive Machines landed its Odysseus robot near the lunar south pole, more than 50 years on from the last Apollo mission in 1972. It was an important moment, not just for the commercial exploitation of space, but for the US space programme in general. Nasa had purchased room on Odysseus for six scientific instruments, and its administrator Bill Nelson was quick to add his congratulations to Intuitive Machines for a mission he described as a `triumph`."
                    ]
            ]
        }
    }}

enum Craters : String, CaseIterable, Identifiable, Equatable
{
    case moscoviense, hansteen, giordano, gagarin, langrenus, petavius, copernicus, vaporum, hertzsprung
    var id : Self {self}
    var name: String { rawValue.capitalized }
    
    var title : String {
        switch self {
        case .petavius:
            "Petavius Crater"
        case .moscoviense:
            "Mare Moscoviense"
        case .hansteen:
            "Hansteen & Billy Craters"
        case .giordano:
            "Giordano Bruno Crater"
        case .gagarin:
            "Gagarin Crater"
        case .langrenus:
            "Langrenus Crater"
        case .copernicus:
            "Copernicus Crater"
        case .vaporum:
            "Mare Vaporum"
        case .hertzsprung:
            "Hertzsprung Crater"
        }
    }
    
    var location : SIMD3<Float> {
        switch self {
        case .moscoviense:
            SIMD3<Float>(0.09450978, 0.102491856, -0.14618857)
        case .hansteen:
            SIMD3<Float>(-0.15240201, -0.044419285, 0.12493155)
        case .giordano:
            SIMD3<Float>(-0.05495343, 0.07553014, -0.17911835)
        case .gagarin:
            SIMD3<Float>(0.05045202, -0.001373274, -0.19560353)
        case .langrenus:
            SIMD3<Float>(0.17543897, -0.023305725, 0.09738528)
        case .petavius:
            SIMD3<Float>(0.12979496, -0.07471742, 0.13384296)
        case .copernicus:
            SIMD3<Float>(-0.06730655, 0.03426693, 0.18708718)
        case .vaporum:
            SIMD3<Float>(0.028811904, 0.059029978, 0.19076523)
        case .hertzsprung:
            SIMD3<Float>(-0.16599922, 0.011838794, -0.114062056)
        }
    }

    var description: String {
        switch self {
        case .petavius:
            "Petavius is a large lunar impact crater located to the southeast of the Mare Fecunditatis, near the southeastern lunar limb. The outer wall of Petavius is unusually wide in proportion to the diameter, and displays a double rim along the south and west sides. Rev. T. W. Webb described Petavius as: “one of the finest spots in the Moon: its grand double rampart, on east side nearly 11,000 ft (3,400 m). High, its terraces, and convex interior with central hill and cleft, compose a magnificent landscape in the lunar morning or evening, entirely vanishing beneath a Sun risen but halfway to the meridian.” The most favorable time for viewing this feature through a telescope is when the Moon is only three days old. By the fourth day the crater is nearly devoid of shadow."
        case .moscoviense:
            "Mare Moscoviense (“Sea of Moscow”) is a lunar mare that sits in the Moscoviense basin. It is one of the very few maria on the far side of the Moon. Like Mare Marginis, this mare appears to be fairly thin. However, it is clearly centered within a large impact basin. It is also much lower than either the outer basin floor or the farside highlands. At the center of the basin (or the southwest portion of the mare) is a mascon, or gravitational high. (Wikipedia)"
        case .hansteen:
            "Hansteen is a lunar impact crater that lies near the southwest edge of the Oceanus Procellarum. To the southeast is the flooded crater Billy. The rim of Hansteen is somewhat polygonal in form, especially along the eastern side. There are a few terraces along the northwestern inner wall. The inner floor contains several ridges, hills, and some grooves, many of which parallel the outer rim. There is a flat patch of lower-albedo material in the northeast part of the interior. Paralleling the southwest outer wall is the brief rille designated Rima Hansteen, a formation with a length of about 25 kilometers. To the southeast of the crater rises Mons Hansteen, or Hansteen Alpha (α). This is roughly triangular in shape and occupies an area about 30 km across on the mare. This feature is younger than Hansteen crater and is thought to be an extrusion of volcanic material."
        case .giordano:
            "Giordano Bruno is a 22-kilometre impact crater on the far side of the Moon, just beyond the northeastern limb. It lies in an area that can be viewed during a favorable libration, although the area is viewed from the side and not much detail can be seen. When viewed from orbit, Giordano Bruno is at the center of a symmetrical ray system of ejecta that has a higher albedo than the surrounding surface. The ray material extends for over 150 kilometres and has not been significantly darkened by space erosion. The outer rim of the crater is especially bright compared to its surroundings. To all appearances, this is a young formation that was created in the relatively recent past, geologically speaking. Based on photos from a lunar orbiter, the crater’s age has been estimated at 4 million years. (Wikipedia)"
        case .gagarin:
            "Gagarin is a large lunar impact crater that is located in the southern hemisphere on the far side of the Moon. To the southwest is the crater Pavlov and to the northeast lies Keeler. Closer to the rim are the craters Levi-Civita to the southwest, and Beijerinck to the north-northeast. Isaev lies entirely within the northwest rim of Gagarin. In contrast with the floor of Gagarin, Isaev has a floor with a somewhat low albedo. Six craters falling within the perimeter of Gagarin have been named after pioneers of Russian aviation and astronautics, including Isaev, Grave, Balandin, Raspletin, Kosberg, and Andronov. Gagarin has been heavily eroded by a long history of crater impacts. The worn rim forms a low, circular ridge around the somewhat bowl-shaped interior. The inner floor is covered by a multitude of crater impacts of various dimensions. Little if anything remains of a central ridge, if the crater ever possessed such a feature."
        case .langrenus:
            "Langrenus is an impact crater located near the eastern lunar limb. The feature is circular in shape, but appears oblong due to foreshortening. It lies on the eastern shore of the Mare Fecunditatis. To the south is the overlapping crater pair Vendelinus and the smaller Lamé. On December 30, 1992, Audouin Dollfus of the Observatoire de Paris observed a series of glows on the floor of this crater using the one-meter telescope. These glows changed form with time, and Dollfus expressed the belief that this was likely a gaseous emission. The cracked floor of the crater may have been the source of the gas. Flemish astronomer Michel Florent van Langren was the first person to draw a lunar map while giving names to many of the features, in 1645. He named this crater after himself; it is the only one of his named features that has retained his original designation. (Wikipedia)"
        case .copernicus:
            "Copernicus is a lunar impact crater named after the astronomer Nicolaus Copernicus, located in eastern Oceanus Procellarum. It typifies craters that formed during the Copernican period in that it has a prominent ray system. The crater rays spread as far as 800 kilometers across the surrounding mare, overlying rays from the craters Aristarchus and Kepler. The rays are less distinct than the long, linear rays extending from Tycho, instead forming a nebulous pattern with plumy markings. In multiple locations the rays lie at glancing angles, instead of forming a true radial dispersal. An extensive pattern of smaller secondary craters can also be observed surrounding Copernicus, a detail that was depicted in a map by Giovanni Cassini in 1680. Some of these secondary craters form sinuous chains in the ejecta."
        case .vaporum:
            "An effusive non-monogenetic volcanic dome super-positioned on a ghost crater near the north boundary of Mare Vaporum. LROC Narrow Angle Camera (NAC) mosaic M18144897LR, LRO orbit 11810, January 14, 2012; 1.29 meters resolution, mid-afternoon illumination incidence angle 66.7° imaged from 128.62 km more about: http://lunarnetworks.blogspot.com/2013/02/a-fascinating-effusive-dome-in-mare.html"
        case .hertzsprung:
            "Hertzsprung is an enormous lunar impact crater, or impact basin, that is located on the far side of the Moon, beyond the western limb. In dimension, this formation is larger than several of the lunar mare areas on the near side. It lies in the northwestern fringe of the blast radius of the Mare Orientale impact basin. Nearby craters of note include Michelson across the northeast rim, Vavilov across the western rim, and Lucretius to the southeast"
        }
    }
    
    
    
    var author: String {
        switch self {
        case .petavius:
            "Model by Sebastian Sosnowki"
        case .moscoviense:
            "Modeled by Sebastian Sosnowki"
        case .hansteen:
            "Model by Sebastian Sosnowki"
        case .giordano:
            "Model by Sebastian Sosnowki"
        case .gagarin:
            "Model by Sebastian Sosnowki"
        case .langrenus:
            "Model by Sebastian Sosnowki"
        case .copernicus:
            "Model by Sebastian Sosnowki"
        case .vaporum:
            "Model by Sebastian Sosnowki"
        case .hertzsprung:
            "Model by Sebastian Sosnowki"
        }
    }
    
    var source: String {
        switch self {
        case .petavius:
            "Petavius"
        case .moscoviense:
            "Mare Moscoviense"
        case .hansteen:
            "Hansteen"
        case .giordano:
            "Giordano Bruno"
        case .gagarin:
            "Gagarin"
        case .langrenus:
            "Langrenus"
        case .copernicus:
            "Copernicus"
        case .vaporum:
            "Mare Vaporum"
        case .hertzsprung:
            "Hertzsprung"
        }
        
    }
    var type: String {
        switch self {
        case .petavius:
            "crater"
        case .moscoviense:
            "mare"
        case .hansteen:
            "crater"
        case .giordano:
            "crater"
        case .gagarin:
            "crater"
        case .langrenus:
            "crater"
        case .copernicus:
            "crater"
        case .vaporum:
            "mare"
        case .hertzsprung:
            "crater"
        }
    }
    
    static var customItems: [Craters] = []
    
    // Function to add a new item to the enum
    static func addNewItem(named name: String, location: SIMD3<Float>, source: String) {
        let newItem = Craters(rawValue: name.lowercased()) ?? .petavius
        customItems.append(newItem)
    }
    

}
