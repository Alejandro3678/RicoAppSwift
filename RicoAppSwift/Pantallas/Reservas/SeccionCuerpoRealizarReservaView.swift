//
//  SeccionCuerpoRealizarReservaView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/23/24.
//

import SwiftUI

struct SeccionCuerpoRealizarReservaView: View {
    @State var nombres: String
    @State var apellidos: String
    @State var telefono: String
    @State var solicitudEspecial: String
    @State var comentarios: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                //Titulo
                Text("HAZ TU RESERVA AQUI")
                    .font(.custom("Roboto Bold", size: 30))
                    .foregroundColor(.orange)
                
                CustomTextField(
                    placeholder: "Daniela",
                    text: $nombres,
                    title: "NOMBRES:"
                )
                
                CustomTextField(
                    placeholder: "Perez",
                    text: $apellidos,
                    title: "APELLIDOS:"
                )
                
                CustomTextField(
                    placeholder: "7513-2739",
                    text: $telefono,
                    title: "TELEFONO:"
                )
                
                CustomTextField(
                    placeholder: "Ejemplo de solicitud",
                    text: $solicitudEspecial,
                    title: "SOLICITUDES ESPECIALES:"
                )
                
                CustomTextField(
                    placeholder: "Ejemplo de comentario",
                    text: $comentarios,
                    title: "COMENTARIOS:"
                )
                
                HStack(spacing: 15){
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .border(Color.orange, width: 3)
                    
                    Text("Consiento la recepcion de comunicaciones por e-mail y/o sms.")
                        .foregroundColor(.black)
                        .font(.custom("Roboto Regular", size: 16))
                }
                
                Button(action: {
                    
                }) {
                    Text("RESERVAR")
                        .font(.custom("Roboto Bold", size: 20))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.orange)
                        .cornerRadius(25)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
                .padding(.top, 50)
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
        }
    }
}

struct SeccionCuerpoRealizarReservaView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoRealizarReservaView(
            nombres: "Daniela",
            apellidos: "Perez",
            telefono: "7513-2739",
            solicitudEspecial: "Nada",
            comentarios: "TODO BIEN"
        )
    }
}
