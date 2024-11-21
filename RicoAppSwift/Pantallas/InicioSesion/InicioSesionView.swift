//
//  InicioSesionView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct InicioSesionView: View {
    @State var correo: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                //SECCION ENCABEZADO
                //Logo RicoApp
                Image("logo_ricoapp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 40)
                
                //Mensaje de bienvenida
                Text("Iniciar Sesion")
                    .font(.custom("Allerta", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text("Bienvenido/a")
                    .font(.custom("Actor", size: 20))
                    .foregroundColor(.gray)
                
                Spacer().frame(height: 20)
                
                //SECCION CUERPO
                //Correo Electronico
                CustomTextField(
                    placeholder: "Ingrese su correo",
                    text: $correo,
                    title: "Correo Electronico",
                    keyboardType: .emailAddress
                )
                
                //Contraseña
                CustomTextField(
                    placeholder: "Ingrese su contraseña",
                    text: $password,
                    title: "Contraseña",
                    isSecure: true
                )
                
                //Olvidaste tu contraseña
                HStack{
                    VStack{
                        Text("¿Olvidaste tu contraseña?")
                            .font(.custom("Allerta", size: 18))
                            .foregroundColor(.black)
                        NavigationLink("Presiona aqui", destination: RecuperarPasswordView().navigationBarBackButtonHidden(true) .navigationBarHidden(true))
                            .foregroundColor(.orange)
                            .font(.custom("Actor", size: 18))
                    }
                }
                
                //Boton de iniciar sesion
                Button(action: {
                    //Accion a realizar
                }) {
                    NavigationLink(destination: CustomNavigationBar().navigationBarBackButtonHidden(true) .navigationBarHidden(true)) {
                        Text("Iniciar sesion")
                            .font(.custom("Actor", size: 25))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                }
                .padding(.vertical, 10)
                
                //No estas registrado
                HStack{
                    Text("¿No estas registrado?")
                        .font(.custom("Allerta", size: 18))
                        .foregroundColor(.black)
                    NavigationLink("Registrate", destination: RegistroView().navigationBarBackButtonHidden(true) .navigationBarHidden(true))
                        .foregroundColor(.orange)
                        .font(.custom("Actor", size: 18))
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .navigationBarHidden(true)
            
        }
    }
}

struct InicioSesionView_Previews: PreviewProvider {
    static var previews: some View {
        InicioSesionView()
    }
}
