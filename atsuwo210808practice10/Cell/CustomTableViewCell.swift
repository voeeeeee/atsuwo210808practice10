//
//  CustomTableViewCell.swift
//  atsuwo210808practice10
//
//  Created by 竹辻篤志 on 2021/08/08.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"

    @IBOutlet private weak var prefectureLabel: UILabel!
    @IBOutlet private weak var prefectureNumber: UILabel!

    private static let backgroundColors: [UIColor] = [#colorLiteral(red: 1, green: 0.8219535351, blue: 0.8164971471, alpha: 1), #colorLiteral(red: 0.8699709177, green: 0.9649842381, blue: 0.6015508175, alpha: 1), #colorLiteral(red: 0.7952807546, green: 0.8460763693, blue: 0.9997413754, alpha: 1)]

    func configure(prefacture: Prefecture, row: Int) {
        prefectureLabel.text = prefacture.name
        prefectureNumber.text = String(row + 1)

        backgroundColor = Self.backgroundColors[row % Self.backgroundColors.count]
    }
    
}
