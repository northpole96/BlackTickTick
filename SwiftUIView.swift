//
//  SwiftUIView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 27/10/23.
//

import SwiftUI

struct SwiftUIView: View {
 @State var selected=0
    @Namespace var nameSpace
    var fontWeight = Font.Weight.semibold
    var fontSize:Font = Font.body
    var color1=Color.black
    var color2=Color.white
    var bg = Color.pink
    var padding = 16.0
    var animation1:Animation = .bouncy(duration: 0.3)
    var body: some View {
        VStack {
            Spacer()
            HStack(){
                HStack{
                    Image(systemName: "clock")
                    if(selected==0){
                        Text("Time")
                    }
                }
                .font(fontSize)
                .fontWeight(fontWeight)
                .foregroundColor(selected==0 ? color2 : color1)
                .padding(padding)
                .background(
                    ZStack{
                        if selected==0{
                            bg
                                .cornerRadius(8.0)
                                .matchedGeometryEffect(id: "vv", in: nameSpace)
                        }
                    }
                )
               
                .onTapGesture {
                    withAnimation(animation1){
                        selected=0
                    }
                }
                Spacer()
                HStack{
                    Image(systemName: "calendar")
                    if(selected==1){
                        Text("Calender")
                    }
                    
                    
                }
                .font(fontSize)
                .fontWeight(fontWeight)
                .foregroundColor(selected==1 ? color2 : color1)
                .padding(padding)
                .background(
                    ZStack{
                        if selected==1{
                            bg
                                .cornerRadius(8)
                                .matchedGeometryEffect(id: "vv", in: nameSpace)
                            
                        }
                        
                    }
                )
                
                .onTapGesture {
                    withAnimation(animation1){
                        selected=1
                    }
                }
                Spacer()
                HStack{
                    Image(systemName: "plus")
                    if(selected==2){
                        
                        Text("Add")
                    }
                    
                }
                .font(fontSize)
                .fontWeight(fontWeight)
                .foregroundColor(selected==2 ? color2 : color1)
                .padding(padding)
                .background(
                    ZStack{
                        if selected==2{
                            bg
                                .cornerRadius(8)
                                .matchedGeometryEffect(id: "vv", in: nameSpace)
                            
                        }
                        
                    }
                )
                
                .onTapGesture {
                    withAnimation(animation1){
                        selected=2
                    } 
                }
                Spacer()
                HStack{
                    Image(systemName: "gear")
                    if(selected==3){
                        
                        Text("Settings")
                    }
                    
                }
                .font(fontSize)
                .fontWeight(fontWeight)
                .foregroundColor(selected==3 ? color2 : color1)
                .padding(padding)
                .background(
                    ZStack{
                        if selected==3{
                            bg
                                .cornerRadius(8)
                                .matchedGeometryEffect(id: "vv", in: nameSpace)
                            
                        }
                        
                    }
                )
                
                .onTapGesture {
                    withAnimation(animation1){
                        selected=3
                    }
                }
                
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 80)
//            .background(.gray)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding(.vertical)
    }
}

#Preview {
    SwiftUIView()
}
