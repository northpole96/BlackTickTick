//
//  TestView3.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 30/10/23.
//

import SwiftUI

struct TestView3: View {
    @Namespace var namespace
    @State var op=false
    var body: some View {
        VStack{
            
            HStack{
                if(op){
                    Spacer()
                    VStack{
                        Text("Hello")
                        Text("Hello")
                        Text("Hello")
                    }
                    .padding()
                    .background(.black.opacity(1))
                    .cornerRadius(0)
                    .matchedGeometryEffect(id: "ID", in: namespace)
                }
                else{
                    VStack{
                        Text("Hello")
//                        
                        Text("Hello")
                        
                        Text("Hello")
                    }
                    .padding()
                    .background(.black.opacity(1))
                    .cornerRadius(8)
                    .matchedGeometryEffect(id: "ID", in: namespace)
                    Spacer()
                }
                
            }
            Button(action: {
                withAnimation(.bouncy(duration: 0.3)){
                    op.toggle()
                }
            }, label: {
                
                Image(systemName: "plus")
                    .fontWeight(.medium)
                    .rotationEffect(.degrees(op ? 135 : 0.0))
                    .padding(.vertical,12)
                    .padding(.horizontal,32)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
            })
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    TestView3()
}
