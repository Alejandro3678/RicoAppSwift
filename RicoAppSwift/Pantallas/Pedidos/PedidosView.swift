//
//  PedidosView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct PedidosView: View {
    @Environment(\.presentationMode) var presentationMode // Para volver a la pantalla anterior

    var body: some View {
        VStack {
            // Encabezado con logo y título
            HStack {
                Button(action: {
                    // Acción para volver a la página anterior
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left") // Icono de flecha
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("RicoApp")
                    .font(.title)
                    .bold()
                    .foregroundColor(.orange)
                Spacer()
            }
            .padding()
           
            // Contenido desplazable
            ScrollView {
                VStack(spacing: 16) {
                    // Icono y texto principal
                    Image(systemName: "cart")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                    Text("ORDEN REALIZADA:")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.orange)
                    Divider()
                    Text("DETALLE DE TU ORDEN")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text("Todavía no hay productos agregados en el carrito")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                   
                    Spacer(minLength: 20) // Espaciado extra para separar contenido
                }
                .padding()
            }
           
            // Botón rectangular para procesar el pago
            Button(action: {
                // Acción para procesar el pago
                print("Procesar Pago seleccionado")
            }) {
                Text("Procesar Pago")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity) // Botón que ocupa todo el ancho disponible
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

/*struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OrderView()) {
                    Text("Ir a la pantalla de Orden")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
        }
    }
}*/

struct PedidosView_Previews: PreviewProvider {
    static var previews: some View {
        PedidosView()
    }
}
