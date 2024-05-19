//
//  TaskForArbuzKZApp.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct TaskForArbuzKZApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationControllerWrapper(rootView: TabBarView())
        }
    }
}
