//
//  Platillos.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/27/24.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Platillos: Identifiable, Codable{
    @DocumentID var id: String?
    var idCategoria: String
    var imagenPlatillo: String
    var nombrePlatillo: String
    var descripcionPlatillo: String
    var precioProducto: Double
}
