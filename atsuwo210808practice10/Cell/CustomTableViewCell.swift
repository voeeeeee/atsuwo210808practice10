//
//  CustomTableViewCell.swift
//  atsuwo210808practice10
//
//  Created by 竹辻篤志 on 2021/08/08.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var prefectureLabel: UILabel!
    @IBOutlet weak var prefectureNumber: UILabel!

    func configure(prefactureName: String) {
        self.prefectureLabel.text = prefactureName
    }
    
}
