//
//  CollectionCellData.swift
//  GrubityIntern
//
//  Created by DUY on 9/20/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import Foundation

struct TopRateds: Codable {
    let topRated: [TopRated]
}

struct TopRated: Codable {
    let Title: String
    let Location: String
    let Name: String
    let Price: String
    let Background: String
    let Avatar: String
    // Decode Json
    static func dataFromBundles() -> [TopRated] {
        var topRateds: [TopRated] = []
        let url = Bundle.main.url(forResource: "topRated", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(TopRateds.self, from: data)
            topRateds = json.topRated
        }
        catch {
            print(error)
        }
        return topRateds
    }
}
