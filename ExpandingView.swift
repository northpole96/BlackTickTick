//
//  ExpandingView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 30/10/23.
//

import SwiftUI

struct ExpandingView: View {
    @Namespace var namespace
    @State var closed=true
    var body: some View {
        
        
        ZStack{
            if(!closed){
                ScrollView{
                    VStack{
                        Text("Helo").font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 700)
                    .background(Color.orange
                        .cornerRadius(12)
                        .matchedGeometryEffect(id: "vv", in: namespace)
                    )
                  
                    .onTapGesture {
                        withAnimation(){
                            closed.toggle()
                        }
                    }
                }
                .zIndex(3.0)
            }
                
            ScrollView(){
                VStack{
                    
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.blue
                    .cornerRadius(12)
                            
                )
                .onTapGesture {
                    withAnimation(.bouncy){
                        closed.toggle()
                    }
                }
                
                
                if(closed){
                    VStack{
                        Text("Helo").font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .background(Color.orange
                        .cornerRadius(12)
                        .matchedGeometryEffect(id: "vv", in: namespace)
                    )
                    
                    .onTapGesture {
                        withAnimation(.bouncy){
                            closed.toggle()
                        }
                    }
                    
                    
                }
                
                else{
                    
                    VStack{
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .background(Color.orange
                        .cornerRadius(12)
                       
                    )
                    
                    
                    
                    
                }
               

                
            }
            .padding()
        }
        
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    ExpandingView()
}
