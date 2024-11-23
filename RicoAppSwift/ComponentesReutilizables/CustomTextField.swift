//
//  CustomTextField.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var title: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(title)
                .font(.custom("Allerta", size: 18))
            if isSecure {
                SecureField(placeholder, text: $text)
                    .font(.custom("Actor", size: 18))
                    .foregroundColor(Color(.darkGray))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.orange, lineWidth: 1)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .font(.custom("Actor", size: 18))
                    .foregroundColor(Color(.darkGray))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .keyboardType(keyboardType)
            }
        }
    }
}
