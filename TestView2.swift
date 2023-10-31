//
//
//  TestView2.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 29/10/23.
//

import SwiftUI

struct TestView2: View {
    @State var closed=true
    var body: some View {
        VStack{
            
            VStack{
                
                Button(action: {
                    withAnimation(.bouncy(duration: 0.4) ){
                        closed.toggle()
                    }
                }, label: {
                    
                        Rectangle()
                            .frame( maxWidth: closed ? 100 : .infinity )
                        
                            .frame(height: closed ? 40 : 300)
                            .cornerRadius(12)
                    
                })
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    TestView2()
}
