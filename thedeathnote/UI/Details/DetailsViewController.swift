//
//  DetailsViewController.swift
//  thedeathnote
//
//  Created by Charley on 22/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class DetailsViewController: UIViewController {
    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var deathDescriptionLabel: UILabel!
    
    var detailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        pictureImageView.image = detailsViewModel.person?.picture
        deathDescriptionLabel.text = detailsViewModel.formattedDeathDescription()
    }
}
