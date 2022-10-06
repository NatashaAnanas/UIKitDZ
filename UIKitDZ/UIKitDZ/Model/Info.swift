//
//  Storage.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Хранилище данных пользователя
struct Info {
    var usersMap: [String: String] = UserDefaults.standard.object(forKey: "dict") as? [String: String] ?? [:]
    
    static var info = Info()
    
    private init() {
    }
}
