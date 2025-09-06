//
//  BaseResponseProtocol.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

protocol BaseResponseProtocol {
 
    var statusCode  : Int? { get }
    var message     : String? { get }
}
