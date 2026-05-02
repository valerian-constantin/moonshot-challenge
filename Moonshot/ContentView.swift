//
//  ContentView.swift
//  Moonshot
//
//  Created by Valentin Constantin on 24/04/2026.
//

import SwiftUI



struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State private var switchView = true
  
 
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                if switchView {
                    GridPrincipal()
                        
                        .background(.darkBackground)
                            .preferredColorScheme(.dark)
                            .transition(.asymmetric(
                                            insertion: .move(edge: .leading),
                                            removal: .move(edge: .leading)
                                        ))
                            
                           
                            
                } else {
                    GridSecundar()
                    
                    .background(.darkBackground)
                        .preferredColorScheme(.dark)
                        .transition(.asymmetric(
                                        insertion: .move(edge: .trailing),
                                        removal: .move(edge: .trailing)
                                    ))
                        
                      
                }
                
                
            } .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .navigationDestination(for: Astronaut.self) { crewMember in
                AstronautView(astronaut: crewMember)
            }
            .navigationTitle(switchView ? "Missions" : "Astronauts")
                .navigationBarTitleDisplayMode(.inline)
            
            
            .toolbar{
                Button(switchView ? "List" : "Grid") {
                    withAnimation(.spring()) {
                        switchView.toggle()
                    }
                        
                    
                    
                    //
                }
            } 
           
           
            
        }
        
        
        
        
        
        
        
        
        
    }
}

#Preview {
    ContentView()
}
