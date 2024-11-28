//
//  CategoriasViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/27/24.
//

import Foundation
import FirebaseFirestore

class CategoriasViewModel: ObservableObject{
    @Published var categorias: [Categorias] = []

        private let db = Firestore.firestore()

        func fetchCategorias() {
            db.collection("Categorias").getDocuments { snapshot, error in
                if let error = error {
                    print("Error al obtener las categorías: \(error)")
                    return
                }
                
                self.categorias = snapshot?.documents.compactMap { document -> Categorias? in
                    let data = document.data()
                    return Categorias(
                        id: document.documentID,
                        imagenUrl: data["ImagenUrl"] as? String ?? "",
                        nombreCategoria: data["NombreCategoria"] as? String ?? ""
                    )
                } ?? []
            }
        }
}
