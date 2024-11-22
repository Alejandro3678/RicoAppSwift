//
//  CustomAppBarSecondary.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/20/24.
//

import SwiftUI

struct CustomAppBarSecondary<Destination: View>: View {
    var destination: Destination
    
    var body: some View {
        HStack{
            NavigationLink(destination: destination.navigationBarBackButtonHidden(true) .navigationBarHidden(true)) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }
            
            
            Spacer()
            
            HStack{
                Image("icono_ricoapp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
                Text("RicoApp")
                    .font(.custom("More Sugar", size: 28))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.orange)
    }
}

struct CustomAppBarSecondary_Previews: PreviewProvider {
    static var previews: some View {
        CustomAppBarSecondary(destination: Text("Destino ejemplo"))
    }
}
