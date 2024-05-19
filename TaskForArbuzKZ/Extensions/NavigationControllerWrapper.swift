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
        let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: rootView))
        navigationController.isNavigationBarHidden = true
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        guard let hostingController = uiViewController.viewControllers.first as? UIHostingController<Content> else {
            return
        }
        hostingController.rootView = rootView
    }
}
