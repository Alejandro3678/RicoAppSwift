//
//  SeccionCuerpoEditarPerfilView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct SeccionCuerpoEditarPerfilView: View {
    @State private var nombres: String = ""
    @State private var apellidos: String = ""
    @State private var telefono: String = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 10){
                //Titulo y Logo
                Image("logo_perfil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("EDITAR INFORMACION")
                    .font(.custom("Roboto Bold", size: 30))
                    .foregroundColor(.black)
                    .padding(.bottom, 15)
                        
                //Spacer()
                            
                // Formulario
                VStack(alignment: .leading, spacing: 15) {
                    // Campo de nombres
                    CustomTextField(
                        placeholder: "DANIELA",
                        text: $nombres,
                        title: "NOMBRES:"
                    )
                                
                    // Campo de apellidos
                    CustomTextField(
                        placeholder: "PEREZ",
                        text: $apellidos,
                        title: "APELLIDOS:"
                    )
                
                    // Campo de teléfono
                    CustomTextField(
                        placeholder: "7513-2739",
                        text: $telefono,
                        title: "TELEFONO:"
                    )
                    
                }
                .padding(.horizontal, 20)
                            
                Spacer()
                            
                            // Botón de guardar
                    Button(action: {
                        // Acción para guardar los datos
                    }) {
                        Text("GUARDAR")
                            .font(.custom("Roboto Bold", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                Spacer()
            }
        }
    }
}

struct SeccionCuerpoEditarPerfilView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoEditarPerfilView()
    }
}
