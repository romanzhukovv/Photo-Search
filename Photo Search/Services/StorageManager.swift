//
//  StorageManager.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import RealmSwift

protocol StorageManagerProtocol {
    func savePhoto(photo: Photo)
    func deletePhoto(photo: Photo)
    func checkFavorite(photo: Photo) -> Bool
}

final class StorageManager: StorageManagerProtocol {
    
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    var favoritePhotos: Results<Photo>
    
    private init() {
        favoritePhotos = realm.objects(Photo.self)
    }
    
    func savePhoto(photo: Photo) {
        write {
            let photoCopy = realm.create(Photo.self, value: photo, update: .all)
            realm.add(photoCopy)
        }
    }
    
    func deletePhoto(photo: Photo) {
        write {
            realm.delete(realm.object(ofType: Photo.self, forPrimaryKey: photo.id) ?? Photo())
        }
    }
    
    func checkFavorite(photo: Photo) -> Bool {
        return realm.object(ofType: Photo.self, forPrimaryKey: photo.id) != nil
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }
}
