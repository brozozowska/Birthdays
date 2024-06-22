//
//  Friend.swift
//  Birthdays
//
//  Created by Сергей Розов on 22.06.2024.
//

import Foundation
import SwiftData

@Model
class Friend {
    let name: String
    let birthdate: Date
    
    init(name: String, birthdate: Date) {
        self.name = name
        self.birthdate = birthdate
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthdate)
    }
}
