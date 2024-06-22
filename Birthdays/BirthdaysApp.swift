//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Сергей Розов on 22.06.2024.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
