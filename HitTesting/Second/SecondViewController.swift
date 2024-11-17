//
//  SecondViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

// Здесь можно попробовать расширить область нажатия для View

final class SecondViewController: UIViewController {
    
    let purpleView = PurpleView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPurpleViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutPurpleViews()
        
    }
    
    private func setupPurpleViews() {
        view.addSubview(purpleView)
    }
    
    private func layoutPurpleViews() {
        let purpleViewSize = purpleView.sizeThatFits(view.bounds.size)
        let purpleViewOrigin = CGPoint(
            x: view.center.x - purpleViewSize.width / 2.0,
            y: view.center.y - purpleViewSize.height / 2.0
        )
        purpleView.frame = CGRect(origin: purpleViewOrigin, size: purpleViewSize)
        
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("SecondViewController.View touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("SecondViewController.View touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("SecondViewController.View touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("SecondViewController.View touchesCancelled")
    }
    
}
