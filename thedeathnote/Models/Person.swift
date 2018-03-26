//
//  Person.swift
//  thedeathnote
//
//  Created by Charley on 22/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

class Person: Codable {
    var firstName: String!
    var lastName: String!
    var deathDescription: String!
    var picture: UIImage!
    var deathDate: Date!
    
    init(firstName: String, lastName: String, deathDescription: String, picture: UIImage, deathDate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.deathDescription = deathDescription
        self.picture = picture
        self.deathDate = deathDate
    }
    
    // MARK: - Codable
    
    enum CodingKeys: String, CodingKey {
        case firstName = "kFirstName"
        case lastName = "kLastName"
        case deathDescription = "kdeathDescription"
        case picture = "kPicture"
        case deathDate = "kDeathDate"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(deathDescription, forKey: .deathDescription)
        try container.encode(deathDate, forKey: .deathDate)
        
        // Storing the image as an encoded String
        let imageData: Data = UIImageJPEGRepresentation(picture, 1)!
        let imageStringBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        try container.encode(imageStringBase64, forKey: .picture)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        deathDescription = try values.decode(String.self, forKey: .deathDescription)
        deathDate = try values.decode(Date.self, forKey: .deathDate)
        
        let imageStringBase64: String = try values.decode(String.self, forKey: .picture)
        let imageData: Data = Data(base64Encoded: imageStringBase64, options: .ignoreUnknownCharacters)!
        picture = UIImage(data: imageData)
    }
}
