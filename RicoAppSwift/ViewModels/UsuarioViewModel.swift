//
//  UsuarioViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/26/24.
//

import Foundation
import Firebase

class UsuarioViewModel: ObservableObject{
    @Published var nombreCompleto: String = "Cargando..."
    
    //Para traer Nombres y Apellidos del Usuario
    func fetchUsuario(){
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No se encontro el ID del usuario")
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("Usuarios").document(userId)
        
        userRef.getDocument { document, error in
            if let error = error {
                print("Error al obtener los datos del usuario: \(error)")
                return
            }
            
            if let document = document, document.exists{
                let data = document.data()
                let nombres = data?["Nombres"] as? String ?? "Usuario"
                let apellidos = data?["Apellidos"] as? String ?? ""
                
                DispatchQueue.main.async {
                    self.nombreCompleto = "\(nombres) \(apellidos)"
                }
                
            } else {
                print("El documento del usuario no existe")
            }
        }
    }
    
}
