//
//  GridPrincipal.swift
//  Moonshot
//
//  Created by Valentin Constantin on 25/04/2026.
//

import SwiftUI

struct GridPrincipal: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        
                        
                    }.clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.lightBackground))
                    
                    
                }
                
            }
                .padding([.horizontal, .bottom])
                .transition(.slide)
        }
    }
}
    
    #Preview {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        
        return GridPrincipal()
            .preferredColorScheme(.dark)
    }

