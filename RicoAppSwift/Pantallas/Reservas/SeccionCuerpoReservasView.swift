//
//  SeccionCuerpoReservasView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/22/24.
//

import SwiftUI
import FirebaseAuth

struct SeccionCuerpoReservasView: View {
    @StateObject private var reservasViewModel = ReservasViewModel()
    
    @State private var selectedRestaurante = "Restaurante San Salvador"
    @State private var selectedGuests = 1
    @State private var reservationDate = Date()
    @State private var reservationTime = Date()
    @State private var solicitudEspecial: String = ""
    @State private var alertaVisible = false
    @State private var colorSnack = Color.black
    @State private var mensaje = ""
    @State private var navigateToReservation = false
    @State private var disponibilidadConfirmada = false
    @State private var showSnackBar = false
    
    let cities =
        [
            "Restaurante San Salvador",
            "Restaurante Sonsonate",
            "Restaurante Chalatenango",
            "Restaurante Santa Ana"
        ]
    
    var body: some View {
        ZStack{
            ZStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .center, spacing: 5){
                        // Titulo y Logo
                        Image("logo_reservas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("RESERVACION DE MESAS")
                            .font(.custom("Roboto Bold", size: 30))
                            .foregroundColor(.orange)
                        
                        // Mensaje indicativo
                        Text("Llena los campos para revisar si hay disponibilidad")
                            .font(.custom("Actor", size: 16))
                            .foregroundColor(.orange)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // Formulario para reserva de mesas
                        // Seleccionar sucursal
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
                            .background(Color(.darkGray))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        
                        // Seleccionar invitados
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
                            .background(Color(.darkGray))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        
                        // Seleccionar fecha
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
                            DatePicker("    SELECCIONE UNA FECHA:", selection: $reservationDate, displayedComponents: .date)
                                .datePickerStyle(CompactDatePickerStyle())
                                .font(.custom("Roboto Regular", size: 15))
                                .accentColor(.white)
                                .background(Color(.darkGray))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        
                        // Seleccionar hora
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
                                .accentColor(.white)
                                .frame(width: 170)
                                .background(Color(.darkGray))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        
                        Button(action: {
                            // Acción a realizar
                            verificarDisponibilidad()
                        }) {
                            Text("VERIFICAR")
                                .font(.custom("Roboto Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.orange)
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                        
                        CustomTextEditor(
                            text: $solicitudEspecial,
                            title: "SOLICITUDES ESPECIALES:"
                        )
                        .disabled(!disponibilidadConfirmada)
                        .padding(.top, 10)
                        
                        Button(action: {
                            // Acción a realizar
                            realizarReserva()
                        }) {
                            Text("REALIZAR RESERVAR")
                                .font(.custom("Roboto Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color(.darkGray))
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                        .disabled(!disponibilidadConfirmada)
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            if showSnackBar {
                VStack {
                    Spacer()
                    HStack {
                        Text(mensaje)
                            .font(.custom("Roboto Regular", size: 16))
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                    }
                    .background(colorSnack)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut(duration: 0.3))
                }
                .onAppear {
                    // Dismiss the Snackbar after 4 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            showSnackBar = false
                        }
                    }
                }
            }
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

    private func verificarDisponibilidad() {
        let calendar = Calendar.current
        let now = Date()
        let today = calendar.startOfDay(for: now)
        let selectedDay = calendar.startOfDay(for: reservationDate)
        let selectedHour = calendar.component(.hour, from: reservationTime)
        let selectedMinute = calendar.component(.minute, from: reservationTime)
        
        if selectedRestaurante.isEmpty {
            mensaje = "Por favor, selecciona una sucursal."
            colorSnack = .red
            disponibilidadConfirmada = false
            showSnackBar = true
        } else if selectedGuests < 1 {
            mensaje = "Por favor, selecciona una cantidad de invitados válida."
            colorSnack = .red
            disponibilidadConfirmada = false
            showSnackBar = true
        } else if selectedDay == today {
            if reservationTime <= now {
                mensaje = "No hay disponibilidad para horas pasadas o actuales."
                colorSnack = .red
                disponibilidadConfirmada = false
                showSnackBar = true
            } else if selectedHour >= 22 {
                mensaje = "No hay disponibilidad después de las 10:00 PM."
                colorSnack = .red
                disponibilidadConfirmada = false
                showSnackBar = true
            } else if selectedHour == 21 && selectedMinute >= 30 {
                mensaje = "No hay disponibilidad después de las 9:30 PM."
                colorSnack = .red
                disponibilidadConfirmada = false
                showSnackBar = true
            } else {
                mensaje = "¡Disponibilidad confirmada!"
                colorSnack = .black
                disponibilidadConfirmada = true
                showSnackBar = true
            }
        } else {
            mensaje = "¡Disponibilidad confirmada!"
            colorSnack = .black
            disponibilidadConfirmada = true
            showSnackBar = true
        }
    }
    
    private func realizarReserva() {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let fecha = formatter.string(from: reservationDate)
            
            formatter.dateFormat = "HH:mm"
            let hora = formatter.string(from: reservationTime)
            
            let reserva = Reservas(
                IdUsuario: Auth.auth().currentUser?.uid ?? "", // Cambiar por el ID real del usuario
                FechaReserva: fecha,
                HoraReserva: hora,
                NumeroInvitados: selectedGuests,
                Sucursal: selectedRestaurante,
                SolicitudesEspeciales: solicitudEspecial
            )
            
            reservasViewModel.guardarReserva(reserva)
            mensaje = "¡RESERVA HECHA EXITOSAMENTE!"
            colorSnack = .green
            showSnackBar = true
        }
    
}


struct SeccionCuerpoReservasView_Previews: PreviewProvider {
    static var previews: some View {
        SeccionCuerpoReservasView()
    }
}

 
