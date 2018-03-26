//
//  ListCoordinator.swift
//  thedeathnote
//
//  Created by Charley on 23/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

class ListCoordinator: Coordinator {
    private let presentingViewController: UINavigationController
    private var listViewController: ListViewController?
    
    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.Name.List.rawValue, bundle: nil)
        
        if let listViewController = storyboard.instantiateViewController(withIdentifier: Constants.Storyboards.Indentifier.List.rawValue) as? ListViewController {
            self.listViewController = listViewController
            listViewController.delegate = self
            listViewController.title = Constants.ViewControllers.title.List.rawValue
            presentingViewController.pushViewController(listViewController, animated: true)
        }
    }
}

extension ListCoordinator: ListViewControllerDelegate {
    func didTapAddPerson() {
        let addPersonCoordinator = AddPersonCoordinator.init(presentingViewController: self.presentingViewController)
        addPersonCoordinator.start()
    }
    
    func didSelect(person: Person) {
        let detailsCoordinator = DetailsCoordinator.init(presentingViewController: self.presentingViewController, person: person)
        detailsCoordinator.start()
    }
}
