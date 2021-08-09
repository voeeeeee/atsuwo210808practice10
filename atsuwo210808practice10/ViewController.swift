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
    private var disposeBag = DisposeBag()
    private var prefectureDetail = BehaviorRelay<[PrefectureModel]>(value:
                                                                [PrefectureModel(prefectureName: "北海道"),
                                                                 PrefectureModel(prefectureName: "青森県"),
                                                                 PrefectureModel(prefectureName: "岩手県"),
                                                                 PrefectureModel(prefectureName: "宮城県"),
                                                                 PrefectureModel(prefectureName: "秋田県"),
                                                                 PrefectureModel(prefectureName: "山形県"),
                                                                 PrefectureModel(prefectureName: "福島県"),
                                                                 PrefectureModel(prefectureName: "茨城県"),
                                                                 PrefectureModel(prefectureName: "栃木県"),
                                                                 PrefectureModel(prefectureName: "群馬県"),
                                                                 PrefectureModel(prefectureName: "埼玉県"),
                                                                 PrefectureModel(prefectureName: "千葉県"),
                                                                 PrefectureModel(prefectureName: "東京都"),
                                                                 PrefectureModel(prefectureName: "神奈川県"),
                                                                 PrefectureModel(prefectureName: "新潟県"),
                                                                 PrefectureModel(prefectureName: "富山県"),
                                                                 PrefectureModel(prefectureName: "石川県"),
                                                                 PrefectureModel(prefectureName: "福井県"),
                                                                 PrefectureModel(prefectureName: "山梨県"),
                                                                 PrefectureModel(prefectureName: "長野県"),
                                                                 PrefectureModel(prefectureName: "岐阜県"),
                                                                 PrefectureModel(prefectureName: "静岡県"),
                                                                 PrefectureModel(prefectureName: "愛知県"),
                                                                 PrefectureModel(prefectureName: "三重県"),
                                                                 PrefectureModel(prefectureName: "滋賀県"),
                                                                 PrefectureModel(prefectureName: "京都府"),
                                                                 PrefectureModel(prefectureName: "大阪府"),
                                                                 PrefectureModel(prefectureName: "兵庫県"),
                                                                 PrefectureModel(prefectureName: "奈良県"),
                                                                 PrefectureModel(prefectureName: "和歌山県"),
                                                                 PrefectureModel(prefectureName: "鳥取県"),
                                                                 PrefectureModel(prefectureName: "島根県"),
                                                                 PrefectureModel(prefectureName: "岡山県"),
                                                                 PrefectureModel(prefectureName: "広島県"),
                                                                 PrefectureModel(prefectureName: "山口県"),
                                                                 PrefectureModel(prefectureName: "徳島県"),
                                                                 PrefectureModel(prefectureName: "香川県"),
                                                                 PrefectureModel(prefectureName: "愛媛県"),
                                                                 PrefectureModel(prefectureName: "高知県"),
                                                                 PrefectureModel(prefectureName: "福岡県"),
                                                                 PrefectureModel(prefectureName: "佐賀県"),
                                                                 PrefectureModel(prefectureName: "長崎県"),
                                                                 PrefectureModel(prefectureName: "熊本県"),
                                                                 PrefectureModel(prefectureName: "大分県"),
                                                                 PrefectureModel(prefectureName: "宮崎県"),
                                                                 PrefectureModel(prefectureName: "鹿児島県"),
                                                                 PrefectureModel(prefectureName: "沖縄県")])


    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupRx()
    }


    func register() {
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }

    func setupRx() {
        prefectureDetail.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "CustomTableViewCell", cellType: CustomTableViewCell.self)) { (row, element, cell) in
                cell.prefectureNumber.text = String(row + 1)
                cell.configure(prefactureName: element.prefectureName)

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

