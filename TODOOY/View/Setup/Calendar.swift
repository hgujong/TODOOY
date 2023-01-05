//
//  Cal.swift
//  TODO
//
//  Created by 서종현 on 2022/12/22.
// 

import SwiftUI

struct Calendar: View {
    @State var date = Date()
    
    static let dateformat: DateFormatter = {
          let formatter = DateFormatter()
           formatter.dateFormat = "YYYY / M / d"
           return formatter
       }()
    
    var body: some View {
        VStack {
            DatePicker(
                "DatePicker",
                selection: $date,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            
            Text("Date is \(date, formatter: Calendar.dateformat)")
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
