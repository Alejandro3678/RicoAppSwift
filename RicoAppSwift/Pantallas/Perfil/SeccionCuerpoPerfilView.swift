//
//  SeccionCuerpoPerfilView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct SeccionCuerpoPerfilView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 10){
                //Titulo y Logo
                Image("logo_menu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("PERFIL DE USUARIO")
                    .font(.custom("Roboto Bold", size: 30))
                    .foregroundColor(.orange)
                
                // Sección de información
                VStack(alignment: .leading, spacing: 15) {
                    Text("INFORMACIÓN")
                        .font(.custom("Roboto Bold", size: 24))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.top, 5)
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(Color.orange)
                   
                    VStack(alignment: .leading, spacing: 10) {
                        // Logo y texto
                        HStack {
                            Image("icono_ricoapp")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                        }
                        .padding(.bottom, 5)
                       
                        // Información del usuario
                        Group {
                            Text("NOMBRES:")
                                .font(.custom("Roboto Bold", size: 22))
                                .foregroundColor(.orange)
                            
                            Text("DANIELA")
                                .font(.custom("Roboto Regular", size: 20))
                                .foregroundColor(.white)
                           
                            Text("APELLIDOS:")
                                .font(.custom("Roboto Bold", size: 22))
                                .foregroundColor(.orange)
                            
                            Text("PÉREZ")
                                .font(.custom("Roboto Regular", size: 20))
                                .foregroundColor(.white)
                           
                            Text("TELÉFONO:")
                                .font(.custom("Roboto Bold", size: 22))
                                .foregroundColor(.orange)
                            
                            Text("7513-2739")
                                .font(.custom("Roboto Regular", size: 20))
                                .foregroundColor(.white)
                           
                            Text("CORREO ELECTRÓNICO:")
                                .font(.custom("Roboto Bold", size: 22))
                                .foregroundColor(.orange)
                            
                            Text("danielaperez@gmail.com")
                                .font(.custom("Roboto Regular", size: 20))
                                .foregroundColor(.white)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
                .padding()
                .background(Color(.darkGray))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                // Botones de acción
                VStack(spacing: 10) {
                    Button(action: {
                        //Accion a realizar
                    }) {
                        NavigationLink(destination: EditarPerfilView().navigationBarBackButtonHidden(true) .navigationBarHidden(true)) {
                            Text("EDITAR INFORMACION")
                                .font(.custom("Roboto Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.orange)
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding(.vertical, 10)
                    
                   
                    Button(action: {
                        // Acción para cambiar contraseña
                    }) {
                        HStack {
                            Image(systemName: "lock.fill")
                            Text("CAMBIAR CONTRASEÑA")
                                .font(.custom("Roboto Bold", size: 20))
                        }
                        .foregroundColor(.orange)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
        }
    }
}

struct SeccionCuerpoPerfilView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoPerfilView()
    }
}
