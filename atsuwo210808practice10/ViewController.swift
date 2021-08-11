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

    @IBOutlet private weak var tableView: UITableView!
    private var disposeBag = DisposeBag()

    private var prefectureDetail = BehaviorRelay<[Prefecture]>(
        value:
            ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
            .map { Prefecture(name: $0) }
    )


    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupRx()
    }


    func registerCell() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    func setupRx() {
        prefectureDetail.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: CustomTableViewCell.identifier, cellType: CustomTableViewCell.self)) { (row, element, cell) in
                cell.configure(prefacture: element, row: row)
            }.disposed(by: disposeBag)
    }
}

