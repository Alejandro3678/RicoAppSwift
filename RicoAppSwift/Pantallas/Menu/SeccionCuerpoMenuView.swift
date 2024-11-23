//
//  SeccionCuerpoMenuView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct SeccionCuerpoMenuView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 10){
                //Titulo y Logo
                Image("logo_menu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("MENU DE PLATILLOS")
                    .font(.custom("Roboto Bold", size: 30))
                    .foregroundColor(.orange)
                
                //Mensaje indicativo
                Text("Mira los diferentes platillos disponibles")
                    .font(.custom("Allerta", size: 16))
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                ForEach(0..<5) { _ in
                    CustomTarjetaPlatillos(
                        image: "oferta_pizza",
                        title: "Nachos",
                        description: "Totopos de maiz crujientes cubiertos con queso",
                        price: 4.25,
                        onAddToCart: {print("Se añadio al carrito")}
                    )
                }
            }
            .padding()
        }
    }
}

struct SeccionCuerpoMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoMenuView()
    }
}
