//
//  SeccionCuerpoPlatillosView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/27/24.
//

import SwiftUI

struct SeccionCuerpoPlatillosView: View {
    let idCategoria: String
    let nombreCategoria: String
    
    @StateObject private var platillosViewModel = PlatillosCategoriasViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 10){
                //Titulo y Logo
                Text(nombreCategoria)
                    .font(.custom("Roboto Bold", size: 30))
                    .foregroundColor(.orange)

                //Tarjeta de Platillos
                ForEach(platillosViewModel.platillos) { platillo in
                    CustomTarjetaPlatillos(
                        image: platillo.imagenPlatillo,
                        title: platillo.nombrePlatillo,
                        description: platillo.descripcionPlatillo,
                        price: platillo.precioProducto
                    )
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear{
            platillosViewModel.fetchPlatillos(idCategoria: idCategoria)
        }
    }
}

struct SeccionCuerpoPlatillosView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoPlatillosView(
            idCategoria: "",
            nombreCategoria: "EJEMPLO"
        )
    }
}
