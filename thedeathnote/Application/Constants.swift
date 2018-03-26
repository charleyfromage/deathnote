//
//  Constants.swift
//  thedeathnote
//
//  Created by Charley on 24/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

struct Constants {
    struct Storyboards {
        enum Name:String {
            // Storyboard names
            case List = "List"
            case Details = "Details"
            case AddPerson = "AddPerson"
        }
        
        enum Indentifier: String {
            // Storyboard identifiers for view controllers
            case List = "listViewController"
            case Details = "detailsViewController"
            case AddPerson = "addPersonViewController"
        }
    }
    
    struct ViewControllers {
        enum title: String {
            // View controllers titles
            case List = "Death Note"
            case AddPerson = "Add Person"
        }
    }
    
    struct Labels {
        enum Text: String {
            case FirstName = "Firstname:"
            case LastName = "Lastname:"
            case DeathDate = "Death date:"
        }
        
        enum Format: String {
            case DeathDescriptionFormat = "%@ %@ %@ on %@."
        }
    }
    
    struct Buttons {
        enum Text: String {
            case Cancel = "Cancel"
            case Add = "Add"
            case AddSign = "+"
        }
    }
}
