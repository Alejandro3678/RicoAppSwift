//
//  EditarPerfilView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct EditarPerfilView: View {
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarSecondary(destination: PerfilView())
                        
                SeccionCuerpoEditarPerfilView()
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
    }
}

struct EditarPerfilView_Previews: PreviewProvider {
    static var previews: some View {
        EditarPerfilView()
    }
}
