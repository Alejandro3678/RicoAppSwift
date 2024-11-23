//
//  SeccionCuerpoPedidosView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/23/24.
//

import SwiftUI

struct SeccionCuerpoPedidosView: View {
    @State private var productos: [Producto] = [
        Producto(
            image: "oferta_pizza",
            title: "Pizza Buena",
            description: "De peperonni con salsa de tomato",
            price: 12.50
        ),
        Producto(
            image: "oferta_bebidas",
            title: "Coca Buena",
            description: "De saborizante con azucar glass",
            price: 2.50
        ),
        Producto(
            image: "oferta_tacos",
            title: "Ricos Tacos",
            description: "De carne de res con salsa de tomato",
            price: 3.50
        ),
    ]
    @State private var totalCompra: Double = 10.50
    @State private var showAlert = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 10){
                //Titulo y Logo
                Image("logo_pedidos")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("ORDEN REALIZADA")
                    .font(.custom("Roboto Bold", size: 30))
                    .foregroundColor(.orange)
                    .padding(.bottom, 15)
                
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(Color.orange)
                
                Text("DETALLE DE TU ORDEN")
                    .font(.custom("Roboto Regular", size: 20))
                    .foregroundColor(Color(.darkGray))
                
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(Color.orange)
                
                if productos.isEmpty{
                    Text("Todavia no hay productos agregados en el carrito")
                        .font(.custom("Roboto Italic", size: 18))
                        .frame(width: 300, height: 50, alignment: .center)
                        .foregroundColor(.black)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 25)
                        .padding(.bottom, 25)
                } else {
                    VStack(spacing: 20){
                        ForEach(productos) {producto in
                            CustomTarjetaPedido(
                                image: producto.image,
                                title: producto.title,
                                description: producto.description,
                                price: producto.price
                            )
                        }
                        
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(Color.orange)
                        
                        HStack(spacing: 10){
                            Text("TOTAL")
                                .font(.custom("Roboto Bold", size: 30))
                            Text("$\(totalCompra, specifier: "%.2f")")
                                .font(.custom("Roboto Bold", size: 28))
                                .foregroundColor(.orange)
                        }
                        
                        Button(action: {
                            //Accion a realizar
                            showAlert = true
                        }) {
                            Text("PROCESAR PAGO")
                                .font(.custom("Roboto Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.orange)
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        .alert(isPresented: $showAlert){
                            Alert(
                                title: Text("Confirmar Pago")
                                    .font(.custom("Roboto Bold", size: 20))
                                    .foregroundColor(.black),
                                message: Text("¿Estas seguro de que deseas realizar el pago? Se generara un PDF con el detalle de tu cuenta para su posterior pago en caja")
                                    .font(.custom("Roboto Bold", size: 18))
                                    .foregroundColor(.orange),
                                primaryButton: .default(Text("SI").font(.custom("Roboto Bold", size: 15)) .foregroundColor(.blue), action:{
                                    
                                }),
                                secondaryButton: .cancel(Text("NO").font(.custom("Roboto Bold", size: 15)) .foregroundColor(.red))
                            )
                        }
                        
                        Button(action: {
                            //Accion a realizar
                            productos.removeAll()
                        }) {
                            Text("LIMPIAR CARRITO")
                                .font(.custom("Roboto Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.orange)
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        .padding(.bottom, 40)
                        
                    }
                }
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(Color.orange)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

struct Producto: Identifiable{
    let id = UUID()
    let image: String
    let title: String
    let description: String
    let price: Double
}

struct SeccionCuerpoPedidosView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoPedidosView(
            
        )
    }
}
