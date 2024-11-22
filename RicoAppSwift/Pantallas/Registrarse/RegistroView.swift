//
//  RegistroView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct RegistroView: View {
    @State private var nombres = ""
    @State private var apellidos = ""
    @State private var telefono = ""
    @State private var correo = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 10){
                    //SECCION ENCABEZADO
                    //Logo
                    Image("logo_ricoapp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top, 40)
                    
                    //Titulos
                    Text("Registrate")
                        .font(.custom("Allerta", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    //Para regresar a la pantalla inicio sesion
                    HStack(spacing: 5){
                        Text("¿Ya tienes una cuenta?")
                            .font(.custom("Allerta", size: 18))
                            .foregroundColor(.black)
                        NavigationLink("Iniciar Sesion", destination: InicioSesionView().navigationBarBackButtonHidden(true) .navigationBarHidden(true))
                            .foregroundColor(.orange)
                            .font(.custom("Actor", size: 18))
                    }
                    
                    Text("Por favor llena todos los campos")
                        .font(.custom("Actor", size: 18))
                        .foregroundColor(.gray)
                    
                    //Campos de textos
                    //Nombres
                    CustomTextField(
                        placeholder: "Ingrese sus nombres",
                        text: $nombres,
                        title: "Nombres:")
                    
                    //Apellidos
                    CustomTextField(
                        placeholder: "Ingrese sus apellidos",
                        text: $apellidos,
                        title: "Apellidos")
                    
                    //Telefono
                    CustomTextField(
                        placeholder: "0000-0000",
                        text: $telefono,
                        title: "Telefono:",
                        keyboardType: .phonePad
                    )
                    
                    //Correo
                    CustomTextField(
                        placeholder: "Ingrese su correo electronico",
                        text: $correo,
                        title: "Correo Electronico:",
                        keyboardType: .emailAddress
                    )
                    
                    //Contraseña
                    CustomTextField(
                        placeholder: "Ingrese su contraseña",
                        text: $password,
                        title: "Contraseña:",
                        isSecure: true
                    )
                    
                    //Boton de registrarse
                    Button(action: {
                        
                    }) {
                        Text("Registrarse")
                            .font(.custom("Actor", size: 25))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                    .padding(.vertical, 10)
                    
                    //Spacer()
                }
                .padding(.horizontal, 20)
            }
            .navigationBarHidden(true)
        }
    }
}

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}
