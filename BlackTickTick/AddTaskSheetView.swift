//
//  AddTaskSheetView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 17/10/23.
//

import SwiftUI

struct AddTaskSheetView: View {
    @EnvironmentObject var manager:Manager
    @FocusState var focused:Bool
    @State var priority:Priority=Priority.p1
    @State var list:List?
    @State var name=""
    @State var desc=""
    @State var date=Date()
   
    var body: some View {
        VStack{
            TextField("name", text: $name)
                .padding()
                .background(.black.opacity(0.05))
                .cornerRadius(8)
                .focused($focused)
                .onAppear(){
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        focused=true
                    }
                }
            
            TextField("desription", text: $desc)
                .padding()
                .background(.black.opacity(0.05))
                .cornerRadius(8)
            HStack{
                Menu{
                    Button("add new list"){}
                    ForEach(manager.lists){list in
                        Button(list.name, action: {
                            
                                self.list = list
                            
                        })
                    }
                }label: {
                    Button(action: {}, label: {
                        if let uList=list{
                            Text(uList.name)
                                .padding()
                                .background(.black.opacity(0.05))
                                .cornerRadius(8)
                                .foregroundStyle(.black)
                        }
                        
                        else{
                            Text("Inbox")
                                .padding()
                                .background(.black.opacity(0.05))
                                .cornerRadius(8)
                                .foregroundStyle(.black)
                            
                        }
                    })
                    
                    
            
                }
                Spacer()
            }
            
            HStack{
                
                Menu{
                    
                    Button("Priority1", action: {priority = .p1})
                    Button("Priority2", action: {priority = .p2})
                    Button("Priority3", action: {priority = .p3})
                    Button("Priority4", action: {priority = .p4})
                    
                }label: {
                    Button(action: {}, label: {
                        Text("priority \(priority.rawValue)")
                            .padding()
                            .background(.black.opacity(0.05))
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    })
                    
                }
                Spacer()
            }
            
            
            
            HStack{
                
                DatePicker(selection: $date,displayedComponents: [.date], label: {
                    
                    Text("Date")
                })
                .accentColor(.black)
                .datePickerStyle(.automatic)
                .labelsHidden()
                
                Spacer()
                
            }
            
            
          
            
            Spacer()
            Button(action: {
                let newTask=Task(name: name, date: date, list: list, priority: priority, description: desc)
                manager.tasks.append(newTask)
                manager.today()
                manager.tomorrow()
                
                
            }, label: {
                Text("Submit")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(name=="" ? .black.opacity(0.5) : .black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
            })
            .disabled(name=="")
        }
        .padding()
    }
    
    
 
}

#Preview {
    AddTaskSheetView().environmentObject(Manager())
}
