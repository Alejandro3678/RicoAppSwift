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
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarPrimary(isMenuOpen: $isMenuOpen)
                        
                SeccionCuerpoCategoriasView()
                
            }
            .zIndex(0)
            .disabled(isMenuOpen)
            .navigationBarHidden(true)
                    
            //Menu lateral
            if isMenuOpen {
                CustomMenuLateral(isMenuOpen: $isMenuOpen, authViewModel: authViewModel).transition(.move(edge: .leading))
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
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct CategoriasView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriasView()
    }
}
