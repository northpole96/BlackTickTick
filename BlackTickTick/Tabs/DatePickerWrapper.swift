//
//  DatePickerWrapper.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 27/10/23.
//

import Foundation
import SwiftUI
import UIKit

struct DatePickerWrapper: UIViewRepresentable {
    @Binding var date: Date
    
    func makeUIView(context: Context) -> UIDatePicker {
        let picker = UIDatePicker()
        picker.frame = CGRect(x: 10, y: 50, width: 100, height: 200)

        picker.date = date
        picker.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        picker.sizeToFit()
        picker.datePickerMode = .date
        

        return picker
    }
    
    func updateUIView(_ picker: UIDatePicker, context: Context) {
        picker.date = date
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(date: $date)
    }
    
    class Coordinator: NSObject {
        @Binding private var date: Date
        
        init(date: Binding<Date>) {
            self._date = date
        }
        
        @objc func valueChanged(_ sender: UIDatePicker) {
            date = sender.date
        }
    }
}
