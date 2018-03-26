//
//  ApplicationCoordinator.swift
//  thedeathnote
//
//  Created by Charley on 23/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        
        let listCoordinator = ListCoordinator(presentingViewController: rootViewController)
        window.rootViewController = rootViewController
        listCoordinator.start()
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
