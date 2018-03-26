//
//  ListTableViewCell.swift
//  thedeathnote
//
//  Created by Charley on 23/03/2018.
//  Copyright © 2018 Charley. All rights reserved.
//

import UIKit

fileprivate let cellIdentifier = "cellIdentifier"

class ListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func identifier() -> String {
        return cellIdentifier
    }
}
