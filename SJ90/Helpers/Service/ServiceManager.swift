//
//  ServiceManager.swift
//  SJ90
//
//  Created by Yago on 12/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation
import Alamofire

final class ServiceManager: ServiceManagerProtocol {
    
    func request(method: ServiceHTTPMethod, url: String, parameters: [String : Any]?, encoding: ServiceEncoding, success: @escaping (Data) -> Void,  failure: @escaping ((_ responseError: ServiceError?)->())) {
        
 
        // Type used to define how a set of parameters are applied to request
        let requestEncoding: ParameterEncoding = {
            switch encoding {
            case .default: return URLEncoding.default
            case .json: return JSONEncoding.default
            }
        }()
        
        // HTTP method used
        let requestMethod = HTTPMethod(rawValue: method.rawValue)!
        
        // Request
        Alamofire.request(url, method: requestMethod, parameters: parameters, encoding: requestEncoding)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                switch response.result {
                    
                case .success:
                    guard let responseData = response.data else {
                        failure(ServiceError(type: .badRequest))
                        return
                    }
                    success(responseData)
                    
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        failure(ServiceError(type: .timeout))
                        return
                    }
                }
        }
    }
    
    private func handleError(with response: DataResponse<Any>) -> ServiceError {
        
        guard let statusCode = response.response?.statusCode else {
            return ServiceError(type: .badRequest)
        }
        
        switch statusCode {
        case ServiceError.ErrorType.badRequest.code:
            return ServiceError(type: .badRequest, object: response.data)
        default:
            let errorType = ServiceError.ErrorType(statusCode: statusCode)
            return ServiceError(type: errorType)
        }
    }
}
