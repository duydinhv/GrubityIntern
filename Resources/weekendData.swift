//
//  CheckFeedData.swift
//  GrubityIntern
//
//  Created by DUY on 9/23/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import Foundation

struct Weekends: Codable {
    let weekends: [Weekend]
}

struct Weekend: Codable {
    let Name: String
    let Time: String
    let Price: String
    let Bookmark: Bool
    let Event: String
    let Background: String
    let Location: String
    
    // Decode Json
    static func dataFromBundles() -> [Weekend] {
        var weekends: [Weekend] = []
        let url = Bundle.main.url(forResource: "weekend", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(Weekends.self, from: data)
            weekends = json.weekends
        }
        catch {
            print(error)
        }
        return weekends
    }
}
