//
//  GetRequest.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Alamofire
import UIKit

final class GetRequest: GetRequestable {
    
    func get(url urlString: String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
        makeRequest(url: urlString, completionHandler: completionHandler)
    }
    
    private func makeRequest(url urlString: String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
      
        guard let url = URL(string: urlString) else { return }
        
        Alamofire.request(url).responseData { (response) in
            if let error = response.error as? URLError {
                if error.code == .notConnectedToInternet {
                    completionHandler(nil, NetworkError.offline)
                    return
                }
                completionHandler(nil, NetworkError.offline)
            } else {
                completionHandler(response.data, nil)
            }
   
        }
    
    }
}
