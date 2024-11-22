//
//  CustomAppBarPrimary.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct CustomAppBarPrimary: View {
    //Estado para abrir y cerrar el menu lateral
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        HStack{
            //Para abrir menu lateral
            Button(action: {
                withAnimation{
                    //Cambia el estado del menu
                    isMenuOpen.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            //Logo y titulo centrado
            HStack{
                Image("icono_ricoapp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
                Text("RicoApp")
                    .font(.custom("More Sugar", size: 28))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            //Para ir al carrito de compras
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true) .navigationBarHidden(true)) {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.orange)
    }
}

struct CustomAppBarPrimary_Previews: PreviewProvider {
    static var previews: some View {
        CustomAppBarPrimary(isMenuOpen: .constant(false))
    }
}
