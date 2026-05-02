//
//  MissionView.swift
//  Moonshot
//
//  Created by Valentin Constantin on 25/04/2026.
//

import SwiftUI

struct MissionView: View {
    let crew: [CrewMember]
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    let mission: Mission

    var body: some View {
        
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.top)
                    Text(mission.formattedLaunchDate)
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)

                    VStack(alignment: .leading) {
                       
                        
                        DividerNou()
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)

                        Text(mission.description)
                        DividerNou()
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                
                                ForEach(crew, id: \.role) { crewMember in
                                    NavigationLink {
                                        AstronautView(astronaut: crewMember.astronaut)
                                    } label: {
                                        HStack {
                                            Image(crewMember.astronaut.id)
                                                .resizable()
                                                .frame(width: 120, height: 80)
                                                .clipShape(.circle)
                                                .overlay(
                                                    Circle()
                                                        .strokeBorder(.white, lineWidth: 2)
                                                )

                                            VStack(alignment: .leading) {
                                                Text(crewMember.astronaut.name)
                                                    .foregroundStyle(.white)
                                                    .font(.headline)
                                                Text(crewMember.role)
                                                    .foregroundStyle(.white.opacity(0.5))
                                            }
                                        }
                                        .padding()
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle(String(mission.displayName))
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        
        
    }
}
#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
