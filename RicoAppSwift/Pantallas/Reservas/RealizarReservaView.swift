//
//  RealizarReservaView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/23/24.
//

import SwiftUI

struct RealizarReservaView: View {
    //Estado del menu lateral
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarSecondary(destination: CustomNavigationBar())
                        
                SeccionCuerpoRealizarReservaView(
                    nombres: "Daniela",
                    apellidos: "Perez",
                    telefono: "7513-2739",
                    solicitudEspecial: "Nada",
                    comentarios: "TODO BIEN"
                )
            }
            .zIndex(0)
            .disabled(isMenuOpen)
                    
            //Menu lateral
            if isMenuOpen {
                CustomMenuLateral(isMenuOpen: $isMenuOpen)
                    .zIndex(1)
                    .transition(.move(edge: .leading))
            }
        }
        .background(
            Color.gray.opacity(isMenuOpen ? 0.5 : 0)
                .animation(.easeInOut, value: isMenuOpen)
                .onTapGesture{
                    if isMenuOpen {
                        withAnimation {
                            isMenuOpen = false
                        }
                    }
                }
        )
        //.ignoresSafeArea()
    }
}

struct RealizarReservaView_Previews: PreviewProvider {
    static var previews: some View {
        RealizarReservaView()
    }
}
