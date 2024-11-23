//
//  CustomTarjetasCategorias.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct CustomTarjetasCategorias: View {
    let imagenCategoria: String
    let nombreCategoria: String
    
    var body: some View {
        VStack{
            //Imagen
            Image(imagenCategoria)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipped()
            
            Text(nombreCategoria)
                .font(.custom("Roboto Bold", size: 18))
                .foregroundColor(.white)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(10)
        .frame(width: 150, height: 150)
        .background(Color(.darkGray))
        .cornerRadius(15)
        .shadow(color: Color.black, radius: 8, x: 0, y: 5)
    }
}

struct CustomTarjetasCategorias_Previews: PreviewProvider {
    static var previews: some View {
        CustomTarjetasCategorias(
            imagenCategoria: "logo_reservas",
            nombreCategoria: "PIZZAS"
        )
    }
}
