//
//  CustomTarjetaOfertas.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI

struct CustomTarjetaOfertas: View {
    let image: String
    let title: String
    let description: String
    let price: Double
    let validez: String
    let onAddToCart: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            //Imagen
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            //Titulo
            Text(title)
                .font(.custom("Allerta", size: 18))
                .foregroundColor(.black)
                .lineLimit(1)
            
            //Descripcion
            Text(description)
                .font(.custom("Actor", size: 15))
                .foregroundColor(.white)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack{
                //Validez
                Text("Validez:")
                    .font(.custom("Actor", size: 14))
                    .foregroundColor(.orange)
                Spacer()
                Text(validez)
                    .font(.custom("Actor", size: 14))
                    .foregroundColor(.orange)
            }
            
            VStack{
                HStack{
                    //Precio
                    Text("PRECIO: $")
                        .foregroundColor(.black)
                        .font(.custom("Allerta", size: 16))
                    Text("\(price, specifier: "%.2f")")
                        .font(.custom("Allerta", size: 16))
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    Button(action: onAddToCart){
                        Text("Añadir al carrito")
                            .font(.custom("Roboto Bold", size: 15))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                }
            }
            
        }
        .padding()
        .background(Color(.darkGray))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}
