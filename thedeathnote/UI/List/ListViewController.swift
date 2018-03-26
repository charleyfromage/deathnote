//
//  ListViewController.swift
//  thedeathnote
//
//  Created by Charley on 22/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

protocol ListViewControllerDelegate: class {
    func didTapAddPerson()
    func didSelect(person: Person)
}

class ListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addPersonButton: UIButton!
    
    var listViewModel = ListViewModel()
    var delegate: ListViewControllerDelegate?
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddPersonButton()
        setupCells()
        setupTableViewTapHandling()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        listViewModel.updateView()
    }
    
    // MARK: - UI setup methods
    
    private func setupAddPersonButton() {
        addPersonButton.setTitle(Constants.Buttons.Text.AddSign.rawValue, for: .normal)
        addPersonButton.rx.tap.subscribe(onNext: {
            self.delegate?.didTapAddPerson()
        }).disposed(by: disposeBag)
    }
    
    private func setupCells() {
        listViewModel.persons.asObservable().bind(to: tableView.rx.items(cellIdentifier: ListTableViewCell.identifier(), cellType: ListTableViewCell.self)) { (row, person, cell) in
            cell.textLabel?.text = "\(person.firstName!) \(person.lastName!)"
        }.disposed(by: disposeBag)
    }
    
    private func setupTableViewTapHandling() {
        tableView.rx.modelSelected(Person.self).subscribe(onNext: { person in
            self.delegate?.didSelect(person: person)

            if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
            }
        }).disposed(by: disposeBag)
    }
}
