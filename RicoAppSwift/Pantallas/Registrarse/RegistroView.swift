//
//  RegistroView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct RegistroView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State private var nombres = ""
    @State private var apellidos = ""
    @State private var telefono = ""
    @State private var correo = ""
    @State private var password = ""
    @State private var alertaVisible = false
    @State private var mensaje = ""
    @State private var iconName = ""
    @State private var iconColor = Color.red
    @State private var shouldNavigate = false
    
    func registrarUsuario(){
        if (nombres.isEmpty || apellidos.isEmpty || telefono.isEmpty || correo.isEmpty || password.isEmpty){
                iconName = "xmark.circle.fill"
                iconColor = .red
                mensaje = "Por favor rellene todos los campos"
                alertaVisible.toggle()
            } else {
                authViewModel.signUp(nombres: nombres, apellidos: apellidos, telefono: telefono, correo: correo, password: password) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            iconName = "checkmark.circle.fill"
                            iconColor = .green
                            mensaje = "Registro Exitoso. Por favor, ve a iniciar sesion con tus credenciales."
                            alertaVisible.toggle()
                        case .failure(let error as NSError):
                            if let localizedError = error as? NSError, let errorMessage = localizedError.userInfo[NSLocalizedDescriptionKey] as? String {
                                mensaje = errorMessage
                            } else {
                                mensaje = "Ha ocurrido un error inesperado. Intenta nuevamente."
                            }
                            iconName = "xmark.circle.fill"
                            iconColor = .red
                            alertaVisible.toggle()
                        }
                        limpiarCampos()
                    }
                }
            }
    }
    
    func limpiarCampos() {
        nombres = ""
        apellidos = ""
        telefono = ""
        correo = ""
        password = ""
    }
    
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView(.vertical, showsIndicators: false){
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
                            //Accion registrar
                            registrarUsuario()
                        }) {
                            Text("Registrarse")
                                .font(.custom("Roboto Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.orange)
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        .padding(.vertical, 10)
                    }
                    .padding(.horizontal, 20)
                }
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

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}
