//
//  ListViewModel.swift
//  thedeathnote
//
//  Created by Charley on 22/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import RxCocoa
import RxSwift

class ListViewModel: NSObject {
    let persons: Variable<[Person]> = Variable([])
    
    func updateView() {
        persons.value = DeathNoteManager.sharedInstance.deathNoteList
    }
}
