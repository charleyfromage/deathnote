//
//  AddPersonCoordinator.swift
//  thedeathnote
//
//  Created by Charley on 24/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

class AddPersonCoordinator: Coordinator {
    private let presentingViewController: UINavigationController
    private var addPersonViewController: AddPersonViewController?
    
    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: Constants.Storyboards.Name.AddPerson.rawValue, bundle: nil)
        
        if let addPersonViewController = storyboard.instantiateViewController(withIdentifier: Constants.Storyboards.Indentifier.AddPerson.rawValue) as? AddPersonViewController {
            self.addPersonViewController = addPersonViewController
            addPersonViewController.delegate = self
            addPersonViewController.title = Constants.ViewControllers.title.AddPerson.rawValue
            presentingViewController.present(addPersonViewController, animated: true, completion: nil)
        }
    }
}

extension AddPersonCoordinator: AddPersonViewControllerDelegate {
    func didTapDismiss() {
        addPersonViewController?.dismiss(animated: true, completion: nil)
    }
}
