//
//  EditarPerfilView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI
import FirebaseAuth

struct EditarPerfilView: View {
    @State private var isMenuOpen = false
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var usuarioViewModel = UsuarioViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var alertaVisible = false
    @State private var mensajeAlerta = ""
    @State private var iconoAlerta = "checkmark.circle"
    @State private var colorIconoAlerta = Color.green
    
    var nombres: String
    var apellidos: String
    var telefono: String
    
    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarSecondary(onBackButtonPressed: {
                    presentationMode.wrappedValue.dismiss()
                })
                        
                SeccionCuerpoEditarPerfilView(
                    nombres: nombres,
                    apellidos: apellidos,
                    telefono: telefono) { (nuevosNombres, nuevosApellidos, nuevoTelefono) in
                    usuarioViewModel.updateUsuarios(
                        nombres: nuevosNombres,
                        apellidos: nuevosApellidos,
                        telefono: nuevoTelefono,
                        userID: Auth.auth().currentUser?.uid ?? "") { exito, mensajeError in
                        if exito {
                            mensajeAlerta = "Los datos se han actualizado correctamente"
                            iconoAlerta = "checkmark.circle"
                            colorIconoAlerta = .green
                        } else {
                            mensajeAlerta = "Hubo un problema al actualizar los datos: \(mensajeError)"
                            iconoAlerta = "xmark.circle"
                            colorIconoAlerta = .red
                        }
                        alertaVisible = true
                    }
                }
            }
            .zIndex(0)
            .disabled(isMenuOpen)
            
            if self.alertaVisible {
                GeometryReader{ geometry in
                    CustomAlert(
                        alertaVisible: $alertaVisible,
                        iconName: iconoAlerta,
                        iconColor: colorIconoAlerta,
                        mensaje: mensajeAlerta
                    )
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
            }
                    
            //Menu lateral
            if isMenuOpen {
                CustomMenuLateral(isMenuOpen: $isMenuOpen, authViewModel: authViewModel).transition(.move(edge: .leading))
                    .zIndex(1)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: alertaVisible)
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

/*
struct EditarPerfilView_Previews: PreviewProvider {
    static var previews: some View {
        EditarPerfilView()
    }
}
*/
