//
//  ImageExtension.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
