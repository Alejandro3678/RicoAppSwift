//
//  OfertasViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/26/24.
//

import Foundation
import FirebaseFirestore

class OfertasViewModel: ObservableObject{
    @Published var ofertas: [Ofertas] = []
    private var db = Firestore.firestore()
    
    func fetchOfertas() {
        db.collection("Ofertas").getDocuments { [weak self] (snapshot, error) in
            guard let self = self else { return }
            if let error = error{
                print("Error al obtener ofertas: \(error.localizedDescription)")
                return
            }
            
            self.ofertas = snapshot?.documents.compactMap { doc in
                Ofertas(id: doc.documentID, data: doc.data())
            } ?? []
        }
    }
    
}
