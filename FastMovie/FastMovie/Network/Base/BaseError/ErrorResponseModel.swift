//
//  ErrorResponseModel.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 15/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

struct ErrorResponseModel: Codable {
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
