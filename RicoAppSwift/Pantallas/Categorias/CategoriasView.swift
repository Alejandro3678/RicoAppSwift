//
//  CategoriasView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI

struct CategoriasView: View {
    //Estado del menu lateral
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarPrimary(isMenuOpen: $isMenuOpen)
                        
                Spacer()
                        
                Text("Bienvenido a CATEGORIAS")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
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

struct CategoriasView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriasView()
    }
}
