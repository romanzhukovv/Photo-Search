//
//  SearchedPhotos.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import RealmSwift

class SearchedPhotos: Object, Codable {
    @Persisted var results = List<Photo>()
}
