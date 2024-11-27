//
//  SeccionCuerpoOfertasView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI

struct SeccionCuerpoOfertasView: View {
    @StateObject private var usuarioViewModel = UsuarioViewModel()
    @StateObject private var ofertasViewModel = OfertasViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 10){
                //Seccion mensaje de bienvenida a usuario
                VStack(alignment: .leading){
                    Text("¡Hola, \(usuarioViewModel.nombreCompleto)!")
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
                ForEach(ofertasViewModel.ofertas){ oferta in
                    CustomTarjetaOfertas(
                        image: "https://i0.wp.com/goula.lat/wp-content/uploads/2019/12/hamburguesa-beyond-meat-scaled-e1577396155298.jpg?fit=1600%2C1068&ssl=1",
                        title: oferta.nombre,
                        description: oferta.descripcion,
                        price: oferta.precio,
                        validez: oferta.validez,
                        onAddToCart: {
                            print("\(oferta.nombre) añadido al carrito")
                        }
                    ).padding(.top, 10)
                }
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
        .onAppear{
            //Carga los datos de Firebase al cargar la vista
            usuarioViewModel.fetchUsuario()
            ofertasViewModel.fetchOfertas()
        }
    }
}

struct SeccionCuerpoOfertasView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoOfertasView()
    }
}
