//
//  PlatillosView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/27/24.
//

import SwiftUI

struct PlatillosView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var categoriaViewmodel = CategoriasViewModel()
    let idCategoria: String
    let nombreCategoria: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarSecondary(onBackButtonPressed: {
                    presentationMode.wrappedValue.dismiss()
                })
                        
                SeccionCuerpoPlatillosView(idCategoria: idCategoria, nombreCategoria: nombreCategoria)
            }
        }
        .navigationBarHidden(true)
    }
}



struct PlatillosView_Previews: PreviewProvider {
    static var previews: some View {
        PlatillosView(idCategoria: "1", nombreCategoria: "Ejemplo")
    }
}
