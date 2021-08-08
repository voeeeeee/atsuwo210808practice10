//
//  ViewController.swift
//  atsuwo210808practice10
//
//  Created by 竹辻篤志 on 2021/08/08.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var disposeBag = DisposeBag()
    var prefactureDetail = BehaviorRelay<[PrefactureModel]>(value:
                                                                [PrefactureModel(prefactureName: "北海道"),
                                                                 PrefactureModel(prefactureName: "青森県"),
                                                                 PrefactureModel(prefactureName: "岩手県"),
                                                                 PrefactureModel(prefactureName: "宮城県"),
                                                                 PrefactureModel(prefactureName: "秋田県"),
                                                                 PrefactureModel(prefactureName: "山形県"),
                                                                 PrefactureModel(prefactureName: "福島県"),
                                                                 PrefactureModel(prefactureName: "茨城県"),
                                                                 PrefactureModel(prefactureName: "栃木県"),
                                                                 PrefactureModel(prefactureName: "群馬県"),
                                                                 PrefactureModel(prefactureName: "埼玉県"),
                                                                 PrefactureModel(prefactureName: "千葉県"),
                                                                 PrefactureModel(prefactureName: "東京都"),
                                                                 PrefactureModel(prefactureName: "神奈川県"),
                                                                 PrefactureModel(prefactureName: "新潟県"),
                                                                 PrefactureModel(prefactureName: "富山県"),
                                                                 PrefactureModel(prefactureName: "石川県"),
                                                                 PrefactureModel(prefactureName: "福井県"),
                                                                 PrefactureModel(prefactureName: "山梨県"),
                                                                 PrefactureModel(prefactureName: "長野県"),
                                                                 PrefactureModel(prefactureName: "岐阜県"),
                                                                 PrefactureModel(prefactureName: "静岡県"),
                                                                 PrefactureModel(prefactureName: "愛知県"),
                                                                 PrefactureModel(prefactureName: "三重県"),
                                                                 PrefactureModel(prefactureName: "滋賀県"),
                                                                 PrefactureModel(prefactureName: "京都府"),
                                                                 PrefactureModel(prefactureName: "大阪府"),
                                                                 PrefactureModel(prefactureName: "兵庫県"),
                                                                 PrefactureModel(prefactureName: "奈良県"),
                                                                 PrefactureModel(prefactureName: "和歌山県"),
                                                                 PrefactureModel(prefactureName: "鳥取県"),
                                                                 PrefactureModel(prefactureName: "島根県"),
                                                                 PrefactureModel(prefactureName: "岡山県"),
                                                                 PrefactureModel(prefactureName: "広島県"),
                                                                 PrefactureModel(prefactureName: "山口県"),
                                                                 PrefactureModel(prefactureName: "徳島県"),
                                                                 PrefactureModel(prefactureName: "香川県"),
                                                                 PrefactureModel(prefactureName: "愛媛県"),
                                                                 PrefactureModel(prefactureName: "高知県"),
                                                                 PrefactureModel(prefactureName: "福岡県"),
                                                                 PrefactureModel(prefactureName: "佐賀県"),
                                                                 PrefactureModel(prefactureName: "長崎県"),
                                                                 PrefactureModel(prefactureName: "熊本県"),
                                                                 PrefactureModel(prefactureName: "大分県"),
                                                                 PrefactureModel(prefactureName: "宮崎県"),
                                                                 PrefactureModel(prefactureName: "鹿児島県"),
                                                                 PrefactureModel(prefactureName: "沖縄県")])


    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupRx()
    }


    func register() {
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }

    func setupRx() {
        prefactureDetail.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "CustomTableViewCell", cellType: CustomTableViewCell.self)) { (row, element, cell) in
                cell.prefactureNumber.text = String(row + 1)
                cell.configure(prefactureName: element.prefactureName)

                if row % 3 == 0{
                    cell.backgroundColor = #colorLiteral(red: 1, green: 0.8219535351, blue: 0.8164971471, alpha: 1)
                } else if row % 3 == 1 {
                    cell.backgroundColor = #colorLiteral(red: 0.8699709177, green: 0.9649842381, blue: 0.6015508175, alpha: 1)
                } else {
                    cell.backgroundColor = #colorLiteral(red: 0.7952807546, green: 0.8460763693, blue: 0.9997413754, alpha: 1)
                }
            }.disposed(by: disposeBag)
    }
}

