//
//  GenerateResultObjectToObject.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import Foundation

class GenerateResultObjectToObject<CodableEntity: Codable, Entity> {
    
    private let structGenerator: (CodableEntity) -> Entity
    
    init(_ structGenerator: @escaping (CodableEntity) -> Entity) {
        self.structGenerator = structGenerator
    }
    
    func generate(_ data: Data?, _ error: NetworkError?) -> Result<Entity, NetworkError> {
        if let data = data {
            do {
                let entityCodable = try JSONDecoder().decode(CodableEntity.self, from: data)
                let entity = self.structGenerator(entityCodable)
                return Result.success(entity)
            } catch {
                return Result.fail(.mapping)
            }
        } else if let error = error {
            return Result.fail(error)
        } else {
            return Result.fail(NetworkError.other(nil))
        }
    }
}
