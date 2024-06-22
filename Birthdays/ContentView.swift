//
//  ContentView.swift
//  Birthdays
//
//  Created by Сергей Розов on 22.06.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthdate) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        VStack {
            NavigationStack {
                List(friends) { friend in
                    HStack {
                        if friend.isBirthdayToday {
                            Image(systemName: "birthday.cake")
                        }
                        Text(friend.name)
                            .bold(friend.isBirthdayToday)
                        Spacer()
                        Text(friend.birthdate, format: .dateTime.month(.wide).day().year())
                            .bold(friend.isBirthdayToday)
                    }
                }
                .navigationTitle("Birthdays")
                .safeAreaInset(edge: .bottom) {
                    VStack(alignment: .center, spacing: 20) {
                        Text("New Birthdate")
                            .font(.headline)
                        DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                            TextField("Name", text: $newName)
                                .textFieldStyle(.roundedBorder)
                        }
                        Button("Save") {
                            let newFriend = Friend(name: newName, birthdate: newDate)
                            context.insert(newFriend)
                            
                            newName = ""
                            newDate = .now
                        }
                        .bold()
                    }
                    .padding()
                    .background(.bar)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
