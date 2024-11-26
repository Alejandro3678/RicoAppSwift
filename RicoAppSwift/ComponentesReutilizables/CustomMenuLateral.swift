//
//  CustomMenuLateral.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct CustomMenuLateral: View {
    @Binding var isMenuOpen: Bool
    @ObservedObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .leading){
            //Fondo oscuro
            Color.black.opacity(0.5)
                .onTapGesture{
                    withAnimation{
                        isMenuOpen = false
                    }
                }
            
            //Contenido del menu
            VStack(alignment: .leading){
                Image("icono_ricoapp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.leading, 10)
                    .padding(.top, 20)
                Text("Bienvenido/a")
                    .font(.custom("More Sugar", size: 28))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray)
                
                NavigationLink(destination: PerfilView().navigationBarBackButtonHidden(true) .navigationBarHidden(true)) {
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                        Text("Mi Perfil")
                            .font(.custom("Allerta", size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .font(.headline)
                    .padding(.vertical)
                    .padding(.horizontal)
                }
                
                Button(action: {
                    cerrarSesion()
                }){
                    //Para para cerrar sesion
                    HStack{
                        //Para para cerrar sesion
                        Image(systemName: "arrowshape.turn.up.left")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                        Text("Cerrar Sesion")
                            .font(.custom("Allerta", size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                }
            
                Spacer()
            }
            .frame(width: 250)
            .background(Color.orange)
        }
    }
    
    func cerrarSesion(){
        authViewModel.signOut{ result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    withAnimation{
                        isMenuOpen = false
                    }
                    presentationMode.wrappedValue.dismiss()
                case .failure(let error):
                    print("Error al cerrar sesion: \(error.localizedDescription)")
                }
            }
        }
    }
    
}


