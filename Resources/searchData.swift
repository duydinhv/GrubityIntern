//
//  searchData.swift
//  GrubityIntern
//
//  Created by DUY on 10/16/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import Foundation

struct Search: Decodable {
    let Title: String
    let Name: String
    let Time: String
    let Price: String
    let Background: String
    let Location: String
    let Category: category
    
    enum category: Decodable {
        case all
        case today
        case tomorrow
        case thisWeekend
    }
}

extension Search.category: CaseIterable { }

extension Search.category: RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case "All": self = .all
        case "Today": self = .today
        case "Tomorrow": self = .tomorrow
        case "This weekend": self = .thisWeekend
        default:
            return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .all:
            return "All"
        case .today:
            return "Today"
        case .tomorrow:
            return "Tomorrow"
        case .thisWeekend:
            return "This weekend"
        }
    }
}

extension Search {
    static func searchs() -> [Search] {
        guard
            let url = Bundle.main.url(forResource: "searchs", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Search].self, from: data)
        } catch {
            return []
        }
    }
}
