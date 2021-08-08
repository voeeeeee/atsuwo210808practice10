//
//  CustomTableViewCell.swift
//  atsuwo210808practice10
//
//  Created by 竹辻篤志 on 2021/08/08.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var prefactureLabel: UILabel!
    @IBOutlet weak var prefactureNumber: UILabel!

    func configure(prefactureName: String) {
        self.prefactureLabel.text = prefactureName
    }
    
}
