//
//  DetailsCoordinator.swift
//  thedeathnote
//
//  Created by Charley on 24/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

class DetailsCoordinator: Coordinator {
    private let presentingViewController: UINavigationController
    private var detailsViewController: DetailsViewController?
    private let person: Person
    
    init(presentingViewController: UINavigationController, person: Person) {
        self.presentingViewController = presentingViewController
        self.person = person
    }
    
    func start() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.Name.Details.rawValue, bundle: nil)
        
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: Constants.Storyboards.Indentifier.Details.rawValue) as? DetailsViewController {
            self.detailsViewController = detailsViewController
            detailsViewController.title = "\(person.firstName!) \(person.lastName!)"
            detailsViewController.detailsViewModel.person = person
            presentingViewController.pushViewController(detailsViewController, animated: true)
        }
    }
}
