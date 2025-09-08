//
//  BaseResponseProtocol.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

protocol BaseResponseProtocol {
    
    var statusCode  : Int? { get set}
    var message     : String? { get set }
}
