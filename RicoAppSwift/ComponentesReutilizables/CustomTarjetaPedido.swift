//
//  CustomTarjetaPedido.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct CustomTarjetaPedido: View {
    let image: String
    let title: String
    let description: String
    let price: Double
    let onAddToCart: () -> Void
    let cantidadPlatillo: Int = 1
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            HStack(spacing: 15){
                //Imagen
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150 ,height: 100)
                    .clipped()
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 10){
                    //Titulo
                    Text(title)
                        .font(.custom("Allerta", size: 22))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    //Descripcion
                    Text(description)
                        .font(.custom("Actor", size: 15))
                        .foregroundColor(.white)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    //Precio
                    Text("$ \(price, specifier: "%.2f")")
                        .font(.custom("Allerta", size: 20))
                        .foregroundColor(.orange)
                }
            }
            HStack(spacing: 50){
                
                HStack{
                    Button(action: {
                        print("Eliminar")
                    }){
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    
                    Text("\(cantidadPlatillo)")
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.orange)
                        .cornerRadius(8)
                    
                    
                    Button(action: {
                        print("Eliminar")
                    }){
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                }
                
                
                
                Button(action: {
                    print("Eliminar")
                }){
                    Image(systemName: "trash.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.red)
                }
            }
            
        }
        .padding()
        .background(Color(.darkGray))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

struct CustomTarjetaPedido_Previews: PreviewProvider {
    static var previews: some View {
        CustomTarjetaPedido(
            image: "oferta_pizza",
            title: "Nachos",
            description: "Totopos de maiz crujientes cubiertos con queso",
            price: 4.25,
            onAddToCart: {print("Se añadio al carrito")}
        )
    }
}
