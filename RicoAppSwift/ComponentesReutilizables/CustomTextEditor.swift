//
//  CustomTextEditor.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/28/24.
//

import SwiftUI

struct CustomTextEditor: View {
    @Binding var text: String
    var title: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(title)
                .font(.custom("Allerta", size: 18))
            TextEditor(text: $text)
                .font(.custom("Actor", size: 18))
                .foregroundColor(Color(.darkGray))
                .frame(height: 120)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.orange, lineWidth: 1)
                )
                .keyboardType(keyboardType)
        }
    }
}
