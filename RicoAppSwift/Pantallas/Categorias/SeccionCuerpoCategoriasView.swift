//
//  SeccionCuerpoCategoriasView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct SeccionCuerpoCategoriasView: View {
    @StateObject private var categoriasViewModel = CategoriasViewModel()
    @State private var seleccionarCategoria: Categorias?
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 10){
                //Titulo y Logo
                HStack{
                    Text("CATEGORIAS")
                        .font(.custom("Roboto Bold", size: 30))
                        .foregroundColor(.orange)
                    Image("logo_categorias")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                }
                
                //Mensaje indicativo
                Text("Selecciona la categoria que deseas ver")
                    .font(.custom("Allerta", size: 16))
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                //Tarjeta de Categoria
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 2), spacing: 20) {
                    ForEach(categoriasViewModel.categorias) { categoria in
                        NavigationLink(
                            destination: PlatillosView(idCategoria: categoria.id, nombreCategoria: categoria.nombreCategoria).navigationBarBackButtonHidden(true) .navigationBarHidden(true)
                        ){
                            CustomTarjetasCategorias(
                                imagenCategoria: categoria.imagenUrl,
                                nombreCategoria: categoria.nombreCategoria
                            )
                            .onTapGesture {
                                seleccionarCategoria = categoria
                            }
                        }
                    }
                }
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear{
                categoriasViewModel.fetchCategorias()
            }
            .fullScreenCover(item: $seleccionarCategoria) { categoria in
                PlatillosView(idCategoria: categoria.id, nombreCategoria: categoria.nombreCategoria)
            }
        }
    }
}

struct SeccionCuerpoCategoriasView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoCategoriasView()
    }
}
