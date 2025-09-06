//
//  StringExtension.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 6/9/25.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
