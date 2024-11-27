//
//  RemoteImage.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/26/24.
//

import SwiftUI

struct RemoteImage: View {
    @StateObject private var loader = ImageLoader()
    let url: String
    let placeholder: Image

    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.url = url
        self.placeholder = placeholder
    }

    var body: some View {
        ZStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                placeholder
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .onAppear { loader.loadImage(from: url) }
        .onDisappear { loader.cancel() }
    }
}
