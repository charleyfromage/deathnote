//
//  DeathNoteManager.swift
//  thedeathnote
//
//  Created by Charley on 23/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import Foundation

fileprivate let kDeathNote = "kDeathNote"

class DeathNoteManager: NSObject {
    static let sharedInstance = DeathNoteManager()  // Singleton
    
    var deathNoteList: [Person] = [] {
        didSet {
            deathNoteList = deathNoteList.sorted(by: { $0.lastName! < $1.lastName! })   // Sorting last names by alphabetical order before storing it
            saveDeathNoteList()
        }
    }
    
    fileprivate override init() {
        super.init()
        loadDeathNoteList() // Retrieving the list on initialization
    }
    
    // MARK: - Helpers
    
    fileprivate func saveDeathNoteList() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(deathNoteList), forKey: kDeathNote) // Saving the list to UserDefaults
    }
    
    fileprivate func loadDeathNoteList() {
        if let data = UserDefaults.standard.value(forKey: kDeathNote) as? Data {
            deathNoteList = try! PropertyListDecoder().decode(Array<Person>.self, from: data)   // Loading the list from UserDefaults
        }
    }
}
