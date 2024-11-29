//
//  PerfilView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI
import FirebaseAuth

struct PerfilView: View {
    @State private var isMenuOpen = false
    @StateObject private var authViewModel = AuthViewModel()
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarSecondary(onBackButtonPressed: {
                    presentationMode.wrappedValue.dismiss()
                })
                
                let userID = Auth.auth().currentUser?.uid ?? ""
                    
                SeccionCuerpoPerfilView(userID: userID)
            }
            .zIndex(0)
            .disabled(isMenuOpen)
                    
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
        .navigationBarHidden(true)
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
