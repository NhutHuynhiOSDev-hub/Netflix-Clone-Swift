//
//  APIError.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

enum APIError: Error {
    case badRequest           // 400
    case unauthorized         // 401
    case forbidden            // 403
    case notFound             // 404
    case methodNotAllowed     // 405
    case conflict             // 409
    case unprocessable        // 422
    case internalServerError  // 500
    case serviceUnavailable   // 503
    case timeout              // request timed out
    case network              // network unavailable
    case unknown              // unknown error
    
    var code: Int {
        switch self {
        case .badRequest            : return 400
        case .unauthorized          : return 401
        case .forbidden             : return 403
        case .notFound              : return 404
        case .conflict              : return 409
        case .unprocessable         : return 422
        case .methodNotAllowed      : return 405
        case .internalServerError   : return 500
        case .serviceUnavailable    : return 503
        case .timeout               : return -1001
        case .network               : return -1009
        case .unknown               : return -1
        }
    }
    
    var message: String {
        switch self {
        case .badRequest: return "Bad request. The server could not understand the request."
        case .unauthorized: return "Unauthorized. You need to login or provide valid credentials."
        case .forbidden: return "Forbidden. You do not have permission to access this resource."
        case .notFound: return "Not found. The requested resource could not be found."
        case .methodNotAllowed: return "Method not allowed. The request method is not supported."
        case .conflict: return "Conflict. The request could not be completed due to a conflict."
        case .unprocessable: return "Unprocessable entity. The server cannot process the request."
        case .internalServerError: return "Internal server error. Something went wrong on the server."
        case .serviceUnavailable: return "Service unavailable. The server is temporarily unavailable."
        case .timeout: return "Request timed out. Please try again."
        case .network: return "Network unavailable. Check your internet connection."
        case .unknown: return "An unknown error occurred. Please try again."
        }
    }
}
