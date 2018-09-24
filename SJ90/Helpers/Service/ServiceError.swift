//
//  ServiceError.swift
//  SJ90
//
//  Created by Yago on 12/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

struct ServiceError {
    var type: ErrorType
    var object: Any?
    
    init(type: ErrorType, object: Any? = nil) {
        self.type = type
        self.object = object
    }
    
    enum ErrorType {
        case tokenNotFound
        case missinParam
        case networkError
        case badRequest
        case unauthorized
        case forbidden
        case notFound
        case internalServerError
        case serviceUnavailable
        case httpUntreated
        case timeout
        case noConnection
        case cancelledRequest
        
        var description: String {
            switch self {
            case .tokenNotFound: return "Token not found"
            case .missinParam: return "Missing or wrong parameter(s) in response"
            case .networkError: return "Network error"
            case .badRequest: return "Bad Request"
            case .unauthorized: return "Unauthorized"
            case .forbidden: return "Forbidden"
            case .notFound: return "Not Found"
            case .internalServerError: return "Internal Server Error"
            case .serviceUnavailable: return "Service unavailable"
            case .httpUntreated: return "HTTP error untreated"
            case .timeout: return "Connection timed out"
            case .noConnection: return "Connection unavailable"
            case .cancelledRequest: return "Request was cancelled"
            }
        }
        
        var code: Int {
            switch self {
            case .badRequest: return 400
            case .unauthorized: return 401
            case .forbidden: return 403
            case .notFound: return 404
            case .internalServerError: return 500
            case .serviceUnavailable: return 503
            default: return -1
            }
        }
        
        init(statusCode: Int) {
            switch statusCode {
            case 400: self = .badRequest
            case 401: self = .unauthorized
            case 403: self = .forbidden
            case 404: self = .notFound
            case 500: self = .internalServerError
            case 503: self = .serviceUnavailable
            default: self = .httpUntreated
            }
        }
    }
}
