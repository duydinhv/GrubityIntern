//
//  FoodData.swift
//  GrubityIntern
//
//  Created by DUY on 10/4/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import Foundation

struct Tomorrows: Codable {
    let tomorrows: [Tomorrow]
}

struct Tomorrow: Codable {
    let Avatar: String
    let Title: String
    let Name: String
    let Price: String
    
    // Decode json
    static func dataFromBundles() -> [Tomorrow] {
        var tomorrows: [Tomorrow]  = []
        let url = Bundle.main.url(forResource: "tomorrow", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(Tomorrows.self, from: data)
            tomorrows = json.tomorrows
        }
        catch {
            print(error)
        }
        return tomorrows
    }
}
