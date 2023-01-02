//
//  Photo.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import RealmSwift

class Photo: Object, Codable {
    @Persisted(primaryKey: true) var id: String?
    @Persisted var created_at: String?
    @Persisted var likes: Int?
    @Persisted var urls : Sizes?
    @Persisted var user: User?
    @Persisted var downloads: Int?
}

class Sizes: Object, Codable {
    @Persisted var small: String?
    @Persisted var full: String?
}

class User: Object, Codable {
    @Persisted var name: String?
    @Persisted var location: String?
}
