//
//  SeccionCuerpoReservasView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI

struct SeccionCuerpoReservasView: View {
    @State private var selectedRestaurante = "Restaurante 1 - San Salvador"
    @State private var selectedGuests = 1
    @State private var reservationDate = Date()
    @State private var reservationTime = Date()
    
    let cities =
        [
            "Restaurante 1 - San Salvador",
            "Restaurante 2 - Santa Ana",
            "Restaurante 3 - San Miguel"
        ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 5){
                //Titulo y Logo
                Image("logo_reservas")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("RESERVACION DE MESAS")
                    .font(.custom("Roboto Bold", size: 30))
                    .foregroundColor(.orange)
                
                //Mensaje indicativo
                Text("Revisar si hay disponibilidad")
                    .font(.custom("Actor", size: 18))
                    .foregroundColor(.orange)
                
                //Formulario para reserva de mesas
                //Seleccionar sucusal
                Section(
                    header: Text("Elige la sucursal de tu preferencia:")
                        .font(.custom("Roboto Bold", size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                ){
                    Text("\(selectedRestaurante)")
                        .font(.custom("Roboto Regular", size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    Picker("Sucursal", selection: $selectedRestaurante){
                        ForEach(cities, id: \.self){ city in
                            Text(city)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue.opacity(0.1))
                                )
                                .font(.custom("Roboto Bold", size: 15))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .font(.custom("Roboto Bold", size: 20))
                    .foregroundColor(.white)
                    .frame(width: 130, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
                
                //Seleccionar Invitados
                Section(
                    header: Text("Numero de invitados:")
                        .font(.custom("Roboto Bold", size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 15)
                ){
                    Text("\(selectedGuests)")
                        .font(.custom("Roboto Regular", size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    Picker("Cantidad invitados", selection: $selectedGuests){
                        ForEach(1...10, id: \.self){ number in
                            Text("\(number)")
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue.opacity(0.1))
                                )
                                .font(.custom("Roboto Bold", size: 15))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .font(.custom("Roboto Bold", size: 20))
                    .foregroundColor(.white)
                    .frame(width: 220, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
                
                //Seleccionar Fecha
                Section(
                    header: Text("Fecha:")
                        .font(.custom("Roboto Bold", size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 15)
                ){
                    Text("\(reservationDate, formatter: dateFormatter)")
                        .font(.custom("Roboto Regular", size: 20))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    DatePicker("Seleccione una fecha", selection: $reservationDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.orange)
                        .background(Color.gray.opacity(50))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
                
                //Seleccionar Hora
                Section(
                    header: Text("Hora:")
                        .font(.custom("Roboto Bold", size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 15)
                ){
                    Text("\(reservationTime, formatter: timeFormatter)")
                        .font(.custom("Roboto Regular", size: 20))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    DatePicker("Seleccione una fecha", selection: $reservationTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.black)
                        .frame(width: 170)
                        .background(Color.gray.opacity(50))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
 
                Button(action: {
                    
                }) {
                    Text("VERIFICAR")
                        .font(.custom("Actor", size: 25))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.orange)
                        .cornerRadius(25)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
                .padding(.top, 50)
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private var timeFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
}

struct SeccionCuerpoReservasView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoReservasView()
    }
}
