//
//  PlatilloCategoriasView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/27/24.
//

import SwiftUI

struct PlatilloCategoriasView: View {
    let idCategoria: String
    let nombreCategoria: String
    
    @StateObject private var platillosViewModel = PlatillosCategoriasViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Text(nombreCategoria)
                    .font(.custom("Roboto Bold", size: 18))
                    .foregroundColor(.orange)
                    .padding(.top)
                
                if platillosViewModel.isLoading{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                } else if let errorMessage = platillosViewModel.errorMessage {
                    Text(errorMessage)
                        .font(.custom("Roboto Italic", size: 14))
                        .foregroundColor(Color(.darkGray))
                        .padding(())
                } else if platillosViewModel.platillos.isEmpty{
                    Text("No hay productos disponibles en esta categoria.")
                        .font(.custom("Roboto Italic"), size: 14)
                        .foregroundColor(Color(.darkGray))
                } else {
                    ScrollView{
                        VStack(spacing: 15){
                            ForEach(platillosViewModel.platillos){ platillo in
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .onAppear{
                platillosViewModel.fetchPlatillos(idCategoria: idCategoria)
            }
        }
    }
}
