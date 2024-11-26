//
//  InicioSesionView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct InicioSesionView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State private var correo = ""
    @State private var password = ""
    @State private var alertaVisible = false
    @State private var mensaje = ""
    @State private var iconName = ""
    @State private var iconColor = Color.red
    @State private var shouldNavigate = false
    
    func logueoUsuario(){
        if (correo.isEmpty || password.isEmpty){
            iconName = "xmark.circle.fill"
            iconColor = .red
            mensaje = "Por favor rellene todos los campos"
            alertaVisible.toggle()
            } else {
                authViewModel.signIn(correo: correo, password: password) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            withAnimation {
                                shouldNavigate = true
                            }
                        case .failure:
                            iconName = "xmark.circle.fill"
                            iconColor = .red
                            mensaje = "Digita tus credenciales correctamente"
                            alertaVisible.toggle()
                        }
                        limpiarCampos()
                    }
                }
            }
    }
    
    func limpiarCampos() {
        correo = ""
        password = ""
    }
    
    var body: some View {
        ZStack{
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
                        logueoUsuario()
                    }) {
                        Text("Iniciar sesion")
                            .font(.custom("Roboto Bold", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                    .padding(.vertical, 10)
                    
                    //Navegacion condicional
                    NavigationLink(
                        destination: CustomNavigationBar()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true),
                        isActive: $shouldNavigate
                    ){}

                    //No estas registrado
                    HStack{
                        Text("¿No estas registrado?")
                            .font(.custom("Allerta", size: 18))
                            .foregroundColor(.black)
                        NavigationLink("Registrate", destination: RegistroView().navigationBarBackButtonHidden(true) .navigationBarHidden(true))
                            .foregroundColor(.orange)
                            .font(.custom("Actor", size: 18))
                    }
                }
                .padding(.horizontal, 20)
                .navigationBarHidden(true)
            }
            //aqui
            if self.alertaVisible {
                GeometryReader{ geometry in
                    CustomAlert(
                        alertaVisible: $alertaVisible,
                        iconName: iconName,
                        iconColor: iconColor,
                        mensaje: mensaje
                    )
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
            }
        }
    }
}

struct InicioSesionView_Previews: PreviewProvider {
    static var previews: some View {
        InicioSesionView()
    }
}

