//
//  TitleModel.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 15/1/2567 BE.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Content]
}

struct Content: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
