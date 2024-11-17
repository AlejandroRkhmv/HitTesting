//
//  MultyTouchViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 10.11.2024.
//

import UIKit

final class MultyTouchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.isMultipleTouchEnabled = true
    }
    
    private func log(touches: Set<UITouch>, for methodName: String) {
        
        for (index, touch) in touches.enumerated() {
            let point = touch.location(in: self.view)
            print(methodName + "touchIndex = \(index), "  + "point x = \(point.x), " + "point y = \(point.y)")
        }
        
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("MultyTouchViewController.View touchesBegan")
        log(touches: touches, for: "touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("MultyTouchViewController.View touchesMoved")
        log(touches: touches, for: "touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("MultyTouchViewController.View touchesEnded")
        log(touches: touches, for: "touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("MultyTouchViewController.View touchesCancelled")
        log(touches: touches, for: "touchesCancelled")
    }
    
}
