//
//  SheetTest.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 31/10/23.
//

import SwiftUI

struct SheetTest: View {
    @State var isPresented=false
    var body: some View {
        Button(action: {
            isPresented=true
        }, label: {
            
            Text("Open")
                .padding(.vertical,12)
                .padding(.horizontal,24)
                .background(Color.blue.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
        })
        
        .sheet(isPresented: $isPresented, content: {
            Add()
        })
    }
}

#Preview {
    SheetTest()
}


struct Add: View {
    @Environment(\.dismiss) var dismiss
    @State var text=""
    @FocusState var fc
    @State var becomeFirstResponder=false
    
   
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    dismiss()
                    
                }, label: {
                    Image(systemName: "plus")
                        .font(.title3)
                        .rotationEffect(.degrees(45.0))
                        .fontWeight(.medium)
                        .padding(8)
                        .background(.blue.opacity(0.15))
                        .clipShape(Circle())
                })
            }
            HStack{
                MyTextField(becomeFirstResponder: self.$becomeFirstResponder)
                
                    .onAppear {
                        self.becomeFirstResponder = true
                    }
                
                
                    
                
            }
            .frame(width: 100)
            .frame(height: 30)
            .padding()
            .background(.gray)
            .cornerRadius(8)
            
            TextField("Description", text: $text)
//                .focused($fc)
                .textFieldStyle(.roundedBorder)
            Spacer()
            if(fc){
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "plus")
                            .frame(width: 100,height: 40)
                            .background(.blue.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "plus")
                            .frame(width: 100,height: 40)
                            .background(.blue.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    Spacer()
                  
                    
                    Menu(content: {
                        Button("al"){}
                        Button("al"){}
                        Button("al"){}
                    }, label: {
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Add")
                                .frame(width: 100,height: 40)
                                .background(.blue.opacity(0.15))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                    })
                    
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    Add()
}












struct MyTextField: UIViewRepresentable {
    typealias UIViewType = UITextField
        
    
    @Binding var becomeFirstResponder: Bool
    
    func makeUIView(context: Context) -> UITextField {
        let textField=UITextField()
//        textField.layer.cornerRadius=8
//        textField.layer.borderWidth=1
//        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        return textField
//        return UITextField()
    }
    
    func updateUIView(_ textField: UITextField, context: Context) {
        if self.becomeFirstResponder {
            DispatchQueue.main.async {
                textField.becomeFirstResponder()
                self.becomeFirstResponder = false
            }
        }
    }
}
