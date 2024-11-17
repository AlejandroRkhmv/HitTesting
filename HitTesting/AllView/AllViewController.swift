//
//  AllViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class AllViewController: UIViewController {
    
    let allView = AllView()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view = allView
        allView.frame = view.bounds
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllViewController.View touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllViewController.View touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllViewController.View touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllViewController.View touchesCancelled")
    }
    
}
