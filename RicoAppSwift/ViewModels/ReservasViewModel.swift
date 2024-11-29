//
//  ReservasViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/28/24.
//

import Foundation
import FirebaseFirestore

class ReservasViewModel: ObservableObject {
    @Published var mensajeAlerta = ""
    @Published var reservaExitosa = false
    
    private let db = Firestore.firestore()
    
    func guardarReserva(_ reserva: Reservas) {
        do {
            let data = try JSONEncoder().encode(reserva)
            if let reservaDict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                db.collection("Reservaciones").document(reserva.ID).setData(reservaDict) { error in
                    if let error = error {
                        self.mensajeAlerta = "Error al guardar la reserva: \(error.localizedDescription)"
                        self.reservaExitosa = false
                    } else {
                        self.mensajeAlerta = "¡Reserva realizada exitosamente!"
                        self.reservaExitosa = true
                    }
                }
            }
        } catch {
            self.mensajeAlerta = "Error al procesar los datos de la reserva."
            self.reservaExitosa = false
        }
    }
}
