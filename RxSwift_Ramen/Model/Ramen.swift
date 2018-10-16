//
//  Ramen.swift
//  RxSwift_Ramen
//
//  Created by 佐藤賢 on 2018/01/22.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import UIKit
import RxDataSources

//ラーメンデータ定義用の構造体(Model層)
struct Ramen {
    //取得データに関する定義
    let name: String
    let taste: String
    let imageId: String
    let image: UIImage?

    //取得データのイニシャライザ
    init(name: String, taste: String, imageId: String) {
        self.name = name
        self.taste = taste
        self.imageId = imageId
        image = UIImage(named: imageId)
    }
}

//既存の独自型(RxDataSourcesで定義されているIdentifiableType型)を拡張する: RxDataSourcesのプロトコル
extension Ramen: IdentifiableType {
    // 一意のIDを設定
    typealias Identity = String
    var identity: Identity { return imageId }
}
