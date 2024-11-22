//
//  RecuperarPasswordView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct RecuperarPasswordView: View {
    @State private var correo = ""
    
    var body: some View {
        NavigationView{
            VStack{
                CustomAppBarSecondary(destination: InicioSesionView())
                VStack(spacing: 20){
                    CustomTextField(
                        placeholder: "Ingresa tu direccion de correo",
                        text: $correo,
                        title: "Correo Electronico"
                    )
                    .padding(.top, 20)
                    
                    Button(action: {
                        //accion
                    }) {
                        Text("ENVIAR")
                            .font(.custom("Actor", size: 25))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .navigationBarHidden(true)
            }
        }
    }
}

struct RecuperarPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        RecuperarPasswordView()
    }
}
