//
//  RecuperarPasswordViewModel.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/26/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

class RecuperarPasswordViewModel: ObservableObject {
    @Published var correo = ""
    @Published var alertMessage = ""
    @Published var showAlert = false
    
    private var authService = AuthService()
    
    func enviarCorreoRecuperacion() {
        guard !correo.isEmpty else {
            alertMessage = "Por favor, ingresa un correo electrónico válido."
            showAlert = true
            return
        }
        
        authService.resetPassword(correo: correo) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.alertMessage = "Se ha enviado un correo para restablecer la contraseña. Por favor revisa tu bandeja de entrada."
                case .failure(let error):
                    self?.alertMessage = self?.manejarError(error) ?? "Ocurrió un error inesperado."
                }
                self?.showAlert = true
            }
        }
    }
    
    private func manejarError(_ error: Error) -> String {
        if let authError = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: authError.code) {
            switch errorCode {
            case .invalidEmail:
                return "El correo ingresado no es válido."
            case .userNotFound:
                return "No existe un usuario registrado con ese correo electrónico."
            default:
                return "Ocurrió un error. Por favor, intenta de nuevo."
            }
        }
        return "Ocurrió un error inesperado."
    }
}
