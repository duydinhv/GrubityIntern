//
//  CellData.swift
//  GrubityIntern
//
//  Created by DUY on 9/5/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import Foundation

struct Todays: Codable {
    let todays: [Today]
}

struct Today: Codable {
    let Name: String
    let Time: String
    let Price: String
    let Bookmark: Bool
    let Event: String
    let Background: String
    let Location: String

    // Decode Json
    static func dataFromBundles() -> [Today] {
        var todays: [Today] = []
        let url = Bundle.main.url(forResource: "today", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(Todays.self, from: data)
            todays = json.todays
        } catch {
            print(error)
        }
        return todays
    }
}
