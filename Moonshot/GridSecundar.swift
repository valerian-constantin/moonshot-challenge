//
//  GridPrincipal.swift
//  Moonshot
//
//  Created by Valentin Constantin on 25/04/2026.
//

import SwiftUI

struct GridSecundar: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        VStack {
                            HStack(spacing: 0) {
                                
                                    
                                    
                                VStack(spacing: 13) {
                                    Text(mission.displayName)
                                        .font(.system(size: 23))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }.padding()
                                
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(.lightBackground)
                                    
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 80)
                                    
                                    .padding()
                                
                                
                            }
                            
                        }
                        
                        
                    }.clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground))
                    
                    
                }
                
            }.navigationTitle("Moonshot")
                .padding([.horizontal, .bottom])
        }
    }
}
    
    #Preview {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        
        return GridSecundar()
            .preferredColorScheme(.dark)
    }

