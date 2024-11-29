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
    @Published var usuario: Usuarios?
    
    private var db = Firestore.firestore()
    
    //Para traer Nombres y Apellidos del Usuario
    func fetchUsuario(){
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No se encontro el ID del usuario")
            return
        }
        
        //let db = Firestore.firestore()
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
    
    //Para traer datos de la coleccion usuarios
    func fetchDataUsuarios(userID: String){
        db.collection("Usuarios").document(userID).getDocument { snapshot, error in
            if let error = error {
                print("Error al obtener datos del usuario: \(error.localizedDescription)")
                return
            }
            
            guard let data = snapshot?.data() else { return }
            
            DispatchQueue.main.async {
                self.usuario = Usuarios(
                    id: snapshot?.documentID ?? "",
                    nombres: data["Nombres"] as? String ?? "",
                    apellidos: data["Apellidos"] as? String ?? "",
                    telefono: data["Telefono"] as? String ?? "",
                    correo: data["Correo"] as? String ?? ""
                )
            }
            
        }
    }
    
    //Para actualizar datos en la coleccion Usuarios
    func updateUsuarios(nombres: String, apellidos: String, telefono: String, userID: String, completion: @escaping (Bool, String) -> Void){
        let userRef = db.collection("Usuarios").document(userID)
        
        userRef.updateData([
            "Nombres": nombres,
            "Apellidos": apellidos,
            "Telefono": telefono
        ]) { error in
            if let error = error{
                completion(false, error.localizedDescription)
            } else {
                completion(true, "")
            }
        }
        
    }
    
}
