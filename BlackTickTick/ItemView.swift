//
//  ItemView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 16/10/23.
//

import SwiftUI

struct ItemView: View {
    @State var task:Task
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(task.name).font(.headline)
                HStack{
                    if let uList=task.list{
                        
                        Text(uList.name).font(.headline).foregroundStyle(.gray)
                    }
                    else{
                        Text("Inbox").font(.headline).foregroundStyle(.gray)
                        
                    }
                    
                   
                    Text(formatDate(date:task.date)).font(.headline).foregroundStyle(.gray)
                }
            }
            Spacer()
            Text("\(task.priority.rawValue)")
        }
        .padding()
        .background(.black.opacity(0.05))
        .cornerRadius(8)
    }
    
    
    
    private func formatDate(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
}

#Preview {
    ItemView(task: Task(name: "Car wash", date: Date(), list: Manager().lists[0], priority: Priority.p2, description: "jkhsbdjhsdbc"))
}
