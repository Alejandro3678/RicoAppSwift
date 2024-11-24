//
//  AuthViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/23/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var user: Usuarios?
    private var authService = AuthService()
    
    func signUp(nombres: String, apellidos: String, telefono: String, correo: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            authService.signUp(nombres: nombres, apellidos: apellidos, telefono: telefono, correo: correo, password: password) { result in
                switch result {
                case .success:
                    self.user = Usuarios(nombres: nombres, apellidos: apellidos, telefono: telefono, correo: correo)
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func signIn(correo: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            authService.signIn(correo: correo, password: password) { result in
                switch result {
                case .success:
                    // Aquí podrías cargar los datos del usuario si es necesario
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
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
