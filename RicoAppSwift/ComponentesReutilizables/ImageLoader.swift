//
//  ImageLoader.swift
//  RicoAppSwift
//
//  Created by MacOsX on 11/26/24.
//

import SwiftUI
import Foundation
import Combine

class ImageLoader: ObservableObject{
    @Published var image: UIImage?
        private var cancellable: AnyCancellable?

        func loadImage(from url: String) {
            guard let imageURL = URL(string: url) else { return }

            cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in self?.image = $0 }
        }

        func cancel() {
            cancellable?.cancel()
        }
}
