//
//  Reservas.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/28/24.
//

import Foundation

struct Reservas: Codable{
    var ID: String = UUID().uuidString
    var IdUsuario: String
    var FechaReserva: String
    var HoraReserva: String
    var NumeroInvitados: Int
    var Sucursal: String
    var SolicitudesEspeciales: String
}
