//
//  AuthViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var user: Usuarios?
    @Published var isAuthenticated: Bool = false
    private var authService = AuthService()
    private var db = Firestore.firestore()
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else { return }
            
            if let user = user{
                //Usuario autenticado
                self.isAuthenticated = true
                
                self.db.collection("Usuarios").document(user.uid).getDocument { document, error in
                    if let document = document, document.exists,
                       let data = document.data(){
                        self.user = Usuarios(
                            nombres: data["Nombres"] as? String ?? "",
                            apellidos: data["Apellidos"] as? String ?? "",
                            telefono: data["Telefono"] as? String ?? "",
                            correo: user.email ?? ""
                        )
                    } else {
                        print("\(error)")
                    }
                }
            } else {
                //Usuario no autenticado
                self.isAuthenticated = false
                self.user = nil
            }
        }
    }
    
    
    func signUp(nombres: String, apellidos: String, telefono: String, correo: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            authService.signUp(nombres: nombres, apellidos: apellidos, telefono: telefono, correo: correo, password: password) { result in
                switch result {
                case .success:
                    self.user = Usuarios(nombres: nombres, apellidos: apellidos, telefono: telefono, correo: correo)
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(self.mapFirebaseAuthError(error)))
                }
            }
    }
    
    //Para controlar los mensajes de errores
    private func mapFirebaseAuthError(_ error: Error) -> Error {
        if let authError = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: authError.code){
            switch errorCode {
            case .emailAlreadyInUse:
                return NSError(domain: "", code: authError.code, userInfo: [NSLocalizedDescriptionKey: "El correo electronico ya esta en uso."])
            case .weakPassword:
                return NSError(domain: "", code: authError.code, userInfo: [NSLocalizedDescriptionKey: "La contraseña es demasiado debil."])
            case .invalidEmail:
                return NSError(domain: "", code: authError.code, userInfo: [NSLocalizedDescriptionKey: "El correo electronico no es valido."])
            default:
                return authError
            }
        }
        return error
    }
    
    func signIn(correo: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        authService.signIn(correo: correo, password: password) { result in
                switch result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
            authService.signOut { result in
                switch result {
                case .success:
                    self.user = nil
                    self.isAuthenticated = false
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
