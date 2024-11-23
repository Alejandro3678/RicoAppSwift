//
//  PerfilView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI

struct PerfilView: View {
    
    @State private var isMenuOpen = false
    @State private var nombres: String = ""
    @State private var apellidos: String = ""
    @State private var telefono: String = ""

    
    var body: some View {
        ZStack{
            //Contenido Principal
            VStack{
                CustomAppBarPrimary(isMenuOpen: $isMenuOpen)
                        
                Spacer()
                        
                // Título
                Text("EDITAR INFORMACIÓN")
                    .font(.headline)
                    .padding(.top, 10)
                        
                    Spacer()
                            
                // Formulario
                VStack(alignment: .leading, spacing: 15) {
                    // Campo de nombres
                    Text("NOMBRES:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        TextField("Ingrese sus nombres", text: $nombres)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1))
                                
                    // Campo de apellidos
                    Text("APELLIDOS:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Ingrese sus apellidos", text: $apellidos)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1))
                
                    // Campo de teléfono
                    Text("TELÉFONO:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Ingrese su teléfono", text: $telefono)
                        .keyboardType(.phonePad)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1))
                    }
                    .padding(.horizontal, 20)
                            
                    Spacer()
                            
                            // Botón de guardar
                    Button(action: {
                        // Acción para guardar los datos
                    }) {
                        Text("GUARDAR")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                Spacer()
            }
            .zIndex(0)
            .disabled(isMenuOpen)
                    
            //Menu lateral
            if isMenuOpen {
                CustomMenuLateral(isMenuOpen: $isMenuOpen)
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
        //.ignoresSafeArea()
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
