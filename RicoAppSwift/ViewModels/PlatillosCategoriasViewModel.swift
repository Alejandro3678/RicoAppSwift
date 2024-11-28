//
//  PlatillosCategoriasViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/27/24.
//

import Foundation
import FirebaseFirestore

class PlatillosCategoriasViewModel: ObservableObject {
    @Published var platillos: [Platillos] = []
    
    private let db = Firestore.firestore()

    func fetchPlatillos(idCategoria: String) {
        let categoriaReference = db.collection("Categorias").document(idCategoria) // Crea un DocumentReference
        db.collection("Productos")
            .whereField("IdCategoria", isEqualTo: categoriaReference) // Compara con el DocumentReference
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching products: \(error)")
                    return
                }

                self.platillos = snapshot?.documents.compactMap { document in
                    let data = document.data()
                    return Platillos(
                        id: document.documentID,
                        idCategoria: (data["IdCategoria"] as? DocumentReference)?.documentID ?? "",
                        imagenPlatillo: data["ImagenProducto"] as? String ?? "",
                        nombrePlatillo: data["NombreProducto"] as? String ?? "",
                        descripcionPlatillo: data["DescripcionProducto"] as? String ?? "",
                        precioProducto: data["PrecioProducto"] as? Double ?? 0.0
                    )
                } ?? []
            }
    }
}
