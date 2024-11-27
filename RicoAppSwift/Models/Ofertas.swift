//
//  Ofertas.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/26/24.
//

import Foundation

struct Ofertas: Identifiable{
    var id: String
    var imagen: String
    var nombre: String
    var descripcion: String
    var precio: Double
    var validez: String
    
    init(id: String, data: [String: Any]) {
        self.id = id
        self.imagen = data["ImagenOferta"] as? String ?? ""
        self.nombre = data["NombreOferta"] as? String ?? ""
        self.descripcion = data["DescripcionOferta"] as? String ?? ""
        self.precio = data["PrecioOferta"] as? Double ?? 0.0
        self.validez = data["ValidezOferta"] as? String ?? ""
    }
    
}
