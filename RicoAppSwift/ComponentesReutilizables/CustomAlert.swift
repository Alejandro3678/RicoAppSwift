//
//  CustomAlert.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/25/24.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var alertaVisible: Bool
    var iconName: String
    var iconColor: Color
    var mensaje: String
    
    var body: some View {
        
        GeometryReader{_ in
            VStack(alignment: .center){
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(iconColor)
                
                ScrollView(.vertical, showsIndicators: false){
                    Text(mensaje)
                        .font(.custom("Actor", size: 16))
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.horizontal, 25)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                
                Button(action: {
                    alertaVisible.toggle()
                }){
                    Text("Aceptar")
                        .font(.custom("Roboto Bold", size: 20))
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color(.orange))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        
    }
}
