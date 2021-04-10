//
//  UIViewControllerPreview.swift
//  iTunesSearch
//
//  Created by Don Frehulfer on 1/26/21.
//

import SwiftUI
import UIKit

public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    public typealias UIViewControllerType = ViewController
    
    let viewController: ViewController

    public init(_ builder: @escaping () -> ViewController) {
        self.viewController = builder()
    }

    // MARK: - UIViewRepresentable
    public func makeUIViewController(context: Context) -> ViewController {
        self.viewController
    }
    
    public func updateUIViewController(_ viewController: ViewController, context: Context) {

    }
}
