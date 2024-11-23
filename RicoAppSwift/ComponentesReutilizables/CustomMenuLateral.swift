//
//  CustomMenuLateral.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct CustomMenuLateral: View {
    @Binding var isMenuOpen: Bool
    
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
                
                NavigationLink(destination: PerfilInfoView().navigationBarBackButtonHidden(true) .navigationBarHidden(true)) {
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
                
                NavigationLink(destination: InicioSesionView().navigationBarBackButtonHidden(true) .navigationBarHidden(true)) {
                    HStack{
                        Image(systemName: "arrowshape.turn.up.left")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                        Text("Cerrar Sesion")
                            .font(.custom("Allerta", size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .font(.headline)
                    .padding(.vertical)
                    .padding(.horizontal)
                }
                Spacer()
            }
            .frame(width: 250)
            .background(Color.orange)
        }
    }
}


