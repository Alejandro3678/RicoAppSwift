//
//  CustomAlertExitoso.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/25/24.
//

import SwiftUI

struct CustomAlertExitoso: View {
    @Binding var alert: Bool
    @Binding var mensajeExitoso: String
    
    var body: some View {
        GeometryReader{_ in
            VStack(alignment: .center){
                HStack{
                    Text("Error")
                        .font(.custom("Roboto Bold", size: 20))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 25)
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.green)
                
                ScrollView(.vertical, showsIndicators: false){
                    Text(mensajeExitoso)
                        .font(.custom("Actor", size: 16))
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.horizontal, 25)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                
                Button(action: {
                    alert.toggle()
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
