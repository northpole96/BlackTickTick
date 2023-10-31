//
//  TaskView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 16/10/23.
//

import SwiftUI

struct TaskView: View {
    @State var title="Inbox"
        
    @State var isAddSheetPresent=false
    @EnvironmentObject var manager:Manager
    var currentPriority:Priority=Priority.p1
    var start=false
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            VStack{
                
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(.black).font(.title2)
                    })
                    Spacer()
                    Menu{
                        Button("inbox"){
                            manager.today()
                            title="Inbox"
                        }
                        Button("today"){
                            manager.today()
                            title="Today"
                        }
                        Button("tomorrow"){
                        manager.tomorrow()
                        title="Tomorrow"
                        }
                        Button("next 7 days"){manager.lastMonth()
                       title="Next 7 days"
                        }
//                        Button("last 3 days"){manager.last3Days()}
                        ForEach(manager.lists){list in
                            Button(list.name){
                                manager.byList(listt: list)
                                title=list.name
                                
                            }
                        }
                        
                    } label: {
                        Image(systemName: "triangle").foregroundColor(.black).font(.title2)
                    }
                }
                .padding(.horizontal)
                .padding(.top,20)
                //        .padding(.bottom)
                
       
                
                ScrollView(showsIndicators:false){
                    VStack{
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        ForEach(manager.changingTasks){task in
                            ItemView(task: task)
                        }
                    }
                }
                .padding()
                
                
            }
            Button(action: {
                isAddSheetPresent=true
            }, label: {
                Image(systemName: "plus").font(.largeTitle).padding().background(.black).cornerRadius(20).foregroundColor(.white)
            })
            .padding(.trailing,30)
            .padding(.bottom,30)
            .sheet(isPresented: $isAddSheetPresent, content: {
                AddTaskSheetView()
                    .presentationDetents([.large])
            })
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.white)
        
        

        
    }
}

#Preview {
    TaskView().environmentObject(Manager())
}
