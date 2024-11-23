//
//  PedidosView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct PedidosView: View {
    @State private var isMenuOpen = false

    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarSecondary(destination: CustomNavigationBar())
                        
                SeccionCuerpoPedidosView()
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
        .navigationBarHidden(true)
    }
}

struct PedidosView_Previews: PreviewProvider {
    static var previews: some View {
        PedidosView()
    }
}
