//
//  AddPersonViewModel.swift
//  thedeathnote
//
//  Created by Charley on 22/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import RxSwift
import RxCocoa

class AddPersonViewModel {
    var picture: UIImage?
    let firstName: Variable<String> = Variable("")
    let lastName: Variable<String> = Variable("")
    let deathDate: Variable<Date> = Variable(Date())
    let deathDescription: Variable<String> = Variable("")
    
    func addPerson() -> Bool {
        if isValid() {
            let person = Person(firstName: firstName.value.capitalized, lastName: lastName.value.capitalized, deathDescription: deathDescription.value, picture: picture!, deathDate: deathDate.value)
            DeathNoteManager.sharedInstance.deathNoteList.append(person)
            return true
        }
        
        return false
    }
    
    // MARK: - Helpers
    
    fileprivate func isValid() -> Bool {
        // Checking that everything is filled
        let pictureIsValid = picture != nil
        let firstNameIsValid = firstName.value.count > 0
        let lastNameIsValid = lastName.value.count > 0
        let deathDescriptionIsValid = deathDescription.value.count > 0
        
        return pictureIsValid && lastNameIsValid && deathDescriptionIsValid && firstNameIsValid
    }
}
