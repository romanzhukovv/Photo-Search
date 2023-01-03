//
//  Constants.swift
//  Photo Search
//
//  Created by Roman Zhukov on 04.01.2023.
//

import UIKit

enum Constants {
    enum Colors {
        static let saveButton = UIColor.systemBlue
        static let deleteButton = UIColor.systemRed
    }
    
    enum Strings {
        enum Photos {
            static let title = "Photos"
            static let searchBarPlaceholder = "Search photo"
        }
        
        enum Favorite {
            static let title = "Favorite"
        }
        
        enum Detail {
            static let saveAlertTitle = "Saving"
            static let deleteAlertTitle = "Deleting"
            static let saveAlertMessage = "Photo was saved to favorite list"
            static let deleteAlertMessage = "Photo was deleted from favorite list"
            static let alertSubmitTitle = "Ok"
            
            static let saveButtonTitle = "Save to favorite"
            static let deleteButtonTitle = "Delete from favorite"
        }
    }
    
    enum Images {
        enum Photos {
            static let tabBarImage = UIImage(systemName: "photo.on.rectangle.angled") ?? UIImage()
        }
        
        enum Favorite {
            static let tabBarImage = UIImage(systemName: "heart.fill") ?? UIImage()
        }
    }
}
