//
//  TimeTextField.swift
//  KPRC-Payroll
//
//  Created by Hari Dass Khalsa on 12/17/25.
//

import SwiftUI

struct TimeTextField: View {
    var label: String
    @Binding var time: String

    var body: some View {
        TextField(label, text: $time)
           // .textFieldStyle(.roundedBorder)
            .textContentType(.none)
           // .keyboardType(.numberPad)
            .onChange(of: time) { oldValue,newValue in
                    
                    time = formatTimeInput(newValue)
            }
    }

    private func formatTimeInput(_ input: String) -> String {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")

        // Remove non-numeric characters
        let numericString = input.components(separatedBy: allowedCharacterSet.inverted).joined()

        // Limit the input to 4 digits
        var limitedString = String(numericString.prefix(4))

        // Insert colons at appropriate positions (e.g., 2230 -> 22:30)
        let formattedString: String
        if limitedString.count > 2 {
            let index = limitedString.index(limitedString.startIndex, offsetBy: 2)
            let hour = limitedString[..<index]
            let minute = limitedString[index...]
            formattedString = "\(hour):\(minute)"
        } else {
            //limitedString = limitedString + ":00"
            formattedString = limitedString
        }

        return formattedString
    }
}


#Preview {
//    TimeTextField()
}
