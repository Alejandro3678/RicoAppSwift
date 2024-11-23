//
//  SeccionCuerpoOfertasView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI

struct SeccionCuerpoOfertasView: View {
    @State private var nombreUsuario: String = "Jonathan Josue Dominguez Gomez"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 10){
                //Seccion mensaje de bienvenida a usuario
                VStack(alignment: .leading){
                    Text("¡Hola, \(nombreUsuario)!")
                        .font(.custom("Roboto Bold", size: 24))
                        .foregroundColor(.orange)
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(Color.orange)
                }
                
                //Seccion mensaje de PROMOCIONES DESTACADAS
                Text("PROMOCIONES DESTACADAS")
                    .font(.custom("Roboto Bold", size: 18))
                    .foregroundColor(Color(.darkGray))
                    .padding(.top, 20)
                    
                //Seccion Carrusel de Ofertas
                CarruselView()
                    .padding(.top, 10)
                
                //Seccion mensaje de PROMOCIONES DESTACADAS
                Text("MAS PROMOCIONES PARA TI")
                    .font(.custom("Roboto Bold", size: 18))
                    .foregroundColor(Color(.darkGray))
                    .padding(.top, 20)
                
                //Seccion Tarjetas Ofertas
                //FALTA AGREGAR FOREACH PARA QUE SE GENEREN DINAMICAMENTE LAS
                //TARJETAS
                CustomTarjetaOfertas(
                    image: "oferta_pizza",
                    title: "La Nueva Pizza",
                    description: "Disfruta de nuestra nueva pizza en esta promocion. ¡No te lo pierdas!",
                    price: 12.99,
                    validez: "Del 10 al 20 de noviembre",
                    onAddToCart: {print("Se añadio al carrito")}
                ).padding(.top, 10)
                
                CustomTarjetaOfertas(
                    image: "oferta_tacos",
                    title: "La Nueva Pizza",
                    description: "Disfruta de nuestra nueva pizza en esta promocion. ¡No te lo pierdas!",
                    price: 12.99,
                    validez: "Del 10 al 20 de noviembre",
                    onAddToCart: {print("Se añadio al carrito")}
                ).padding(.top, 10)
                
                CustomTarjetaOfertas(
                    image: "oferta_bebidas",
                    title: "La Nueva Pizza",
                    description: "Disfruta de nuestra nueva pizza en esta promocion. ¡No te lo pierdas!",
                    price: 12.99,
                    validez: "Del 10 al 20 de noviembre",
                    onAddToCart: {print("Se añadio al carrito")}
                ).padding(.top, 10)
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
    }
}

struct SeccionCuerpoOfertasView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoOfertasView()
    }
}
