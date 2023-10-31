//
//  MatrixView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 24/10/23.
//

import SwiftUI

struct MatrixView: View {
    @EnvironmentObject var manager:Manager
    var body: some View {
        VStack(spacing:0){
            HStack{
                VStack{
                    Text("Priority 1").fontWeight(.bold)
                ScrollView(showsIndicators: false){
                    VStack(alignment:.leading){
                        ForEach(manager.tasks.filter{$0.priority==Priority.p1}){i in
                            Text("\(i.name)")
                        }
                        
                    }
                    
                } }
                .frame(maxWidth: .infinity,alignment:.topLeading)
                VStack{
                    Text("Priority 2").fontWeight(.bold)
                    ScrollView(showsIndicators: false){
                        VStack(alignment:.leading){
                            ForEach(manager.tasks.filter{$0.priority==Priority.p2}){i in
                                Text("\(i.name)")
                            }
                            
                        }
                        
                    } }
                .frame(maxWidth: .infinity,alignment:.topLeading)

            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            HStack{
                VStack{
                    Text("Priority 3").fontWeight(.bold)
                    ScrollView(showsIndicators: false){
                        VStack(alignment:.leading){
                            ForEach(manager.tasks.filter{$0.priority==Priority.p3}){i in
                                Text("\(i.name)")
                            }
                            
                        }
                        
                    } }
                .frame(maxWidth: .infinity,alignment:.topLeading)
                
                VStack{
                    Text("Priority 4").fontWeight(.bold)
                    ScrollView(showsIndicators: false){
                        VStack(alignment:.leading){
                            ForEach(manager.tasks.filter{$0.priority==Priority.p4}){i in
                                Text("\(i.name)")
                            }
                            
                        }
                        
                    } }
                .frame(maxWidth: .infinity,alignment:.topLeading)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        
    }
}

#Preview {
    MatrixView()
        .environmentObject(Manager())
}
