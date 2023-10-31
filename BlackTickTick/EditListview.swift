//
//  EditListview.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 19/10/23.
//

import SwiftUI

struct EditListview: View {
    @EnvironmentObject var manager:Manager
    
    @State var isPresented=false
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(manager.lists){list in
                    
                    HStack{
                        Text(list.name)
                            .font(.headline)
                        Spacer()
                    }
                }
            }
            
        }.padding()
        HStack{
            Button(action: {
              
                isPresented=true
            
                
            }, label: {
                Spacer()
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isPresented, content: {
              sheetView()
                
            })
            
                
                
            
        }.padding()
    }
}

#Preview {
    EditListview().environmentObject(Manager())
        
}


struct sheetView: View {
    @EnvironmentObject var manager:Manager
    @FocusState var keyboardFocus:Bool
    @State var listName=""

    var body: some View {
        VStack{
            Spacer()
            TextField("list name", text: $listName)
                .padding()
                .background(.black.opacity(0.05))
                .cornerRadius(8)
                .focused($keyboardFocus)
                .onAppear(){
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                        keyboardFocus=true
                    }
                    
                }
            
            Button(action: {
                if(listName != ""){
                    manager.lists.append(List(name: listName))
                    listName=""
                    
                }
                
            }, label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .presentationDetents([.fraction(0.25)])
            })
        }
        .padding()
    }
}

#Preview {
    sheetView()
}
