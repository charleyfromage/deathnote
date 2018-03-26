//
//  DetailsViewModel.swift
//  thedeathnote
//
//  Created by Charley on 22/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import Foundation

class DetailsViewModel {
    var person: Person?
    
    // MARK: - Helpers
    
    func formattedDeathDescription() -> String {
        guard let person = person else {
            return ""
        }
        
        let formattedDeathDate = DateFormatter.localizedString(from: person.deathDate!, dateStyle: .medium, timeStyle: .none)
        
        let formattedDeathDescription = String(format: Constants.Labels.Format.DeathDescriptionFormat.rawValue,
                                               person.firstName!,
                                               person.lastName!,
                                               person.deathDescription!,
                                               formattedDeathDate)
        
        return formattedDeathDescription
    }
}
