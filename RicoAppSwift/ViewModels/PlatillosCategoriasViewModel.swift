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
    
    //PARA TRAER TODOS LOS PLATILLOS DE LA COLECCION PRODUCTOS
    func fetchAllPlatillos(){
        db.collection("Productos").getDocuments { snapshot, error in
            if let error = error {
                print("Error al obtener productos: \(error)")
                return
            }
                    
            guard let documents = snapshot?.documents else { return }
                    
            self.platillos = documents.compactMap { doc -> Platillos? in
                let data = doc.data()
                guard
                    let imagenPlatillo = data["ImagenProducto"] as? String,
                    let nombrePlatillo = data["NombreProducto"] as? String,
                    let descripcionPlatillo = data["DescripcionProducto"] as? String,
                    let precioPlatillo = data["PrecioProducto"] as? Double
                else {
                    return nil
                }
                            
                return Platillos(
                    id: doc.documentID,
                    imagenPlatillo: imagenPlatillo,
                    nombrePlatillo: nombrePlatillo,
                    descripcionPlatillo: descripcionPlatillo,
                    precioProducto: precioPlatillo
                )
            }
        }
    }
}
