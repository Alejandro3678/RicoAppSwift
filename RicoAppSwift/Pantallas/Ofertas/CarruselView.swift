//
//  CarruselView.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/21/24.
//

import SwiftUI

struct CarruselView: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] =
        [
            "oferta_pizza",
            "oferta_tacos",
            "oferta_bebidas"
        ]
    var body: some View {
        VStack{
            ZStack{
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 500)
                        .cornerRadius(25)
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                        .offset(x: CGFloat(index - currentIndex) *
                                    300 + dragOffset, y: 0)
                }
            }
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        let threshold: CGFloat = 50
                        if value.translation.width > threshold {
                            withAnimation{
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } else if value.translation.width < -threshold {
                            withAnimation{
                                currentIndex = min(images.count - 1,
                                    currentIndex + 1)
                            }
                        }
                    })
            )
        }
    }
}

struct CarruselView_Previews: PreviewProvider {
    static var previews: some View {
        CarruselView()
    }
}
