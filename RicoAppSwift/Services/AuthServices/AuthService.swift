//
//  AuthService.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService{
    private var db = Firestore.firestore()
    
    //PARA REGISTRARSE
    func signUp(nombres: String, apellidos: String, telefono: String, correo: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: correo, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let uid = authResult?.user.uid else { return }
            
            let newUser = [
                "Nombres": nombres,
                "Apellidos": apellidos,
                "Telefono": telefono,
                "Correo": correo
            ]
            
            self.db.collection("Usuarios").document(uid).setData(newUser){ error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        }
    }
    
    //PARA INICIO DE SESION
    func signIn(correo: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: correo, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(()))
        }
    }
    
    //PARA CERRAR SESION
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
            do {
                try Auth.auth().signOut()
                completion(.success(()))
            } catch let signOutError as NSError {
                completion(.failure(signOutError))
            }
    }

}
