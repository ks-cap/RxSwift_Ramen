//
//  RamenListController.swift
//  RxSwift_Ramen
//
//  Created by 佐藤賢 on 2018/01/22.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import RxSwift
import RxDataSources

class RamenListController: UIViewController {

    // 監視対象のオブジェクトの一括解放用
    let disposeBag = DisposeBag()
    // Presenter層から表示するラーメンデータの取得
    let ramensData = RamenPresenter()

    // データソースの定義
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Ramen>>(
        // データソースを元にしてセルの生成を行う
        configureCell: { _, tableView, indexPath, ramens in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = ramens.name
            cell.detailTextLabel?.text = ramens.taste
            cell.imageView?.image = ramens.image
            return cell
    },
        // データソースの定義を元にセクションヘッダーを生成する
        titleForHeaderInSection: { (ds, section: Int) -> String in
            return ds[section].model
    }
    )

    @IBOutlet weak var ramenTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 作成したデータと表示するUITableViewをBindして表示する
        ramensData.ramens.bind(to: ramenTableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        // RxSwiftを利用してUITableViewDelegateを適用する
        ramenTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }

}

extension RamenListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(65)
    }
}
