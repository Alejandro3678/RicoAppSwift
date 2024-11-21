//
//  CustomNavigationBar.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI

struct CustomNavigationBar: View {
    //Tab inicial seleccionado
    @State private var selectedTab: Tab = .ofertas
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                //Contenido principal dependiendo del tab seleccionado
                TabView(selection: $selectedTab) {
                    OfertasView()
                        .tag(Tab.ofertas)
                        .navigationBarHidden(true)
                    
                    CategoriasView()
                        .tag(Tab.categorias)
                        .navigationBarHidden(true)
                    
                    MenuView()
                        .tag(Tab.menu)
                        .navigationBarHidden(true)
                    
                    ReservasView()
                        .tag(Tab.reservas)
                        .navigationBarHidden(true)
                        
                }
                
                //Navigation bar personalizada
                HStack{
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Spacer()
                        
                        Button(action: {
                            //Cambia al tab seleccionado
                            selectedTab = tab
                        }) {
                            VStack{
                                Image(systemName: tab.icon)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(selectedTab == tab ? .white : .black)
                                    
                                
                                Text(tab.title)
                                    .font(.custom("Actor", size: 18))
                                    .foregroundColor(selectedTab == tab ? .white : .black)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(selectedTab == tab ? Color.orange : Color.clear)
                            .cornerRadius(8)
                        }
                        Spacer()
                    }
                }
                .frame(height: 100)
                .background(Color.orange)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

enum Tab: String, CaseIterable{
    case ofertas
    case categorias
    case menu
    case reservas
    
    var title: String {
        switch self {
        case .ofertas: return "Ofertas"
        case .categorias: return "Categorias"
        case .menu: return "Menu"
        case .reservas: return "Reservas"
        }
    }
    
    var icon: String {
        switch self {
        case .ofertas: return "tag"
        case .categorias: return "calendar"
        case .menu: return "book"
        case .reservas: return "calendar.badge.clock"
        }
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
