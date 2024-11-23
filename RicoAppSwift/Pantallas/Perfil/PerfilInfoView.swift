import SwiftUI

struct PerfilInfoView: View {
    // Estado del menú lateral
    @State private var isMenuOpen = false
   
    var body: some View {
        ZStack {
            // Contenido Principal
            VStack {
                CustomAppBarPrimary(isMenuOpen: $isMenuOpen)
               
                ScrollView(.vertical) { // ScrollView vertical añadido
                    VStack {
                        // Icono de perfil y título
                        VStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.orange)
                            Text("PERFIL DE USUARIO")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                        }
                        .padding(.top, 5)
                       
                        // Sección de información
                        VStack(alignment: .leading, spacing: 15) {
                            Text("INFORMACIÓN")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.top, 5)
                           
                            Divider()
                                .background(Color.orange)
                           
                            VStack(alignment: .leading, spacing: 10) {
                                // Logo y texto
                                HStack {
                                    Image(systemName: "icono_ricoapp")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                }
                                .padding(.bottom, 5)
                               
                                // Información del usuario
                                Group {
                                    Text("NOMBRES:").font(.subheadline).foregroundColor(.orange)
                                    Text("DANIELA").font(.subheadline).foregroundColor(.white)
                                   
                                    Text("APELLIDOS:").font(.subheadline).foregroundColor(.orange)
                                    Text("PÉREZ").font(.subheadline).foregroundColor(.white)
                                   
                                    Text("TELÉFONO:").font(.subheadline).foregroundColor(.orange)
                                    Text("7513-2739").font(.subheadline).foregroundColor(.white)
                                   
                                    Text("CORREO ELECTRÓNICO:").font(.subheadline).foregroundColor(.orange)
                                    Text("danielaperez@gmail.com").font(.subheadline).foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                       
                        // Botones de acción
                        VStack(spacing: 10) {
                            Button(action: {
                                // Acción para editar información
                            }) {
                                HStack {
                                    Image(systemName: "pencil")
                                    Text("EDITAR INFORMACIÓN")
                                        .font(.headline)
                                }
                                .foregroundColor(.orange)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.orange, lineWidth: 1))
                            }
                           
                            Button(action: {
                                // Acción para cambiar contraseña
                            }) {
                                HStack {
                                    Image(systemName: "lock.fill")
                                    Text("CAMBIAR CONTRASEÑA")
                                        .font(.headline)
                                }
                                .foregroundColor(.orange)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1))
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    }
                }
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
           
            Spacer()
           
            .zIndex(0)
            .disabled(isMenuOpen)
           
            // Menú lateral
            if isMenuOpen {
                CustomMenuLateral(isMenuOpen: $isMenuOpen)
                    .zIndex(1)
                    .transition(.move(edge: .leading))
            }
        }
        .background(
            Color.gray.opacity(isMenuOpen ? 0.5 : 0)
                .animation(.easeInOut, value: isMenuOpen)
                .onTapGesture {
                    if isMenuOpen {
                        withAnimation {
                            isMenuOpen = false
                        }
                    }
                }
        )
    }
}

struct PerfilInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilInfoView()
    }
}
