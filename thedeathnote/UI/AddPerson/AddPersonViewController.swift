//
//  AddPersonViewController.swift
//  thedeathnote
//
//  Created by Charley on 22/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

protocol AddPersonViewControllerDelegate: class {
    func didTapDismiss()
}

class AddPersonViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet var takePictureButton: UIButton!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var deathDateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var deathDescriptionLabel: UILabel!
    @IBOutlet var deathDescriptionTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var addButton: UIButton!
    
    let addPersonViewModel = AddPersonViewModel()
    var delegate: AddPersonViewControllerDelegate?
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupUIBindings()
    }
    
    // MARK: - UI setup methods
    
    func setupLabels() {
        firstNameLabel.text = Constants.Labels.Text.FirstName.rawValue
        lastNameLabel.text = Constants.Labels.Text.LastName.rawValue
        deathDateLabel.text = Constants.Labels.Text.DeathDate.rawValue
        
        cancelButton.setTitle(Constants.Buttons.Text.Cancel.rawValue, for: .normal)
        addButton.setTitle(Constants.Buttons.Text.Add.rawValue, for: .normal)
    }
    
    func setupUIBindings() { // This method could be broken down into several ones
        // Textfields
        firstNameTextField.rx.text.orEmpty.bind(to: addPersonViewModel.firstName).disposed(by: disposeBag)
        lastNameTextField.rx.text.orEmpty.bind(to: addPersonViewModel.lastName).disposed(by: disposeBag)
        deathDescriptionTextField.rx.text.orEmpty.bind(to: addPersonViewModel.deathDescription).disposed(by: disposeBag)
        
        // Datepicker
        datePicker.rx.date.bind(to: addPersonViewModel.deathDate).disposed(by: disposeBag)
        
        // Buttons
        takePictureButton.rx.tap.subscribe(onNext: {
            self.presentImagePicker()
        }).disposed(by: disposeBag)
        
        cancelButton.rx.tap.subscribe(onNext: {
            self.delegate?.didTapDismiss()
        }).disposed(by: disposeBag)
        
        addButton.rx.tap.subscribe(onNext: {
            if (self.addPersonViewModel.addPerson()) {
                self.delegate?.didTapDismiss()
            }
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Helpers
    
    private func presentImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera;
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
}

extension AddPersonViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.addPersonViewModel.picture = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.takePictureButton.setImage(self.addPersonViewModel.picture, for: UIControlState.normal)
        picker.dismiss(animated: true, completion: nil)
    }
}
