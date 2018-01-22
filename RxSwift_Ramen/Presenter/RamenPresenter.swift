//
//  RamenPresenter.swift
//  RxSwift_Ramen
//
//  Created by 佐藤賢 on 2018/01/22.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

//表示データ形式定義に関するPresenterクラス
class RamenPresenter {
  //表示用のデータの具体的な設定をする
  let ramens = Observable.just([
    //引数（model: セクション名, items: [モデル構造体で定義する値の配列]）
    SectionModel(model: "醤油", items: [
      Ramen(name: "豚骨醤油ラーメン",taste: "濃いめ", imageId: "sample005"),
      Ramen(name: "喜多方ラーメン", taste: "あっさり", imageId: "sample009"),
      Ramen(name: "チャーシューメン", taste: "あっさり", imageId: "sample010")
      ]),
    
    SectionModel(model: "塩味", items: [
      Ramen(name: "野菜たっぷりタンメン", taste: "あっさり", imageId: "sample007")
      ]),
    
    SectionModel(model: "味噌", items: [
      Ramen(name: "8番ラーメン味噌味", taste: "ふつう", imageId: "sample001"),
      Ramen(name: "もやしそば味噌味", taste: "濃いめ", imageId: "sample008")
      ]),
    
    SectionModel(model: "その他", items: [
      Ramen(name: "台湾風まぜそば", taste: "濃いめ", imageId: "sample002"),
      Ramen(name: "長崎ちゃんぽん", taste: "ふつう", imageId: "sample003"),
      Ramen(name: "酸辣湯麺", taste: "ふつう", imageId: "sample004"),
      Ramen(name: "トマトと野菜のラーメン", taste: "あっさり", imageId: "sample006")
      ])
    ])
}
