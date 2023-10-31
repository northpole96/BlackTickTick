//
//  TestUIView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 28/10/23.
//

import SwiftUI

struct TestUIView: View {
    @State var text=""
    @FocusState var focus
    var body: some View {
        VStack{
            Spacer()
            TextField("Title", text: $text)
                .focused($focus)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            
            
        }
    }
}

#Preview {
    TestUIView()
}
