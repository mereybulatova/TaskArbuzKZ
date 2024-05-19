//
//  RootViewController.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import SwiftUI

struct NavigationControllerWrapper<Content: View>: UIViewControllerRepresentable {
    var rootView: Content
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setViewControllers([UIHostingController(rootView: rootView)], animated: false)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}
