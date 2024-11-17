//
//  ThirdViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

// Здесь можно попробовать обработать область нажатия для View, которая выходит за область родительской вью.

final class ThirdViewController: UIViewController {
    
    let brownView = BrownView()
    let yellowView = YellowView()
    let blackView = BlackView()
    let orangeView = OrangeView()
    let blueView = BlueView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutViews()
        
    }
    
    // MARK: - Red
    
    private func setupViews() {
        view.addSubview(brownView)
        brownView.addSubview(yellowView)
        brownView.addSubview(blackView)
        view.addSubview(orangeView)
        yellowView.addSubview(blueView)
    }
    
    private func layoutViews() {
        let brownViewSize = brownView.sizeThatFits(view.bounds.size)
        let brownViewOrigin = CGPoint(
            x: view.center.x - brownViewSize.width / 2.0,
            y: view.center.y - brownViewSize.height / 2.0
        )
        brownView.frame = CGRect(origin: brownViewOrigin, size: brownViewSize)
        
        let yellowViewSize = yellowView.sizeThatFits(view.bounds.size)
        let yellowViewOrigin = CGPoint(x: 50.0, y: 200.0)
        yellowView.frame = CGRect(origin: yellowViewOrigin, size: yellowViewSize)
        
        let blackViewSize = blackView.sizeThatFits(view.bounds.size)
        let blackViewOrigin = CGPoint(x: 100.0, y: 450.0)
        blackView.frame = CGRect(origin: blackViewOrigin, size: blackViewSize)
        
        let orangeViewSize = orangeView.sizeThatFits(view.bounds.size)
        let orangeViewOrigin = CGPoint(
            x: view.center.x - orangeViewSize.width / 2.0,
            y: view.center.y - orangeViewSize.height / 2.0
        )
        orangeView.frame = CGRect(origin: orangeViewOrigin, size: orangeViewSize)
        
        let blueViewSize = blueView.sizeThatFits(view.bounds.size)
        let blueViewOrigin = CGPoint(x: 100.0, y: 100.0)
        blueView.frame = CGRect(origin: blueViewOrigin, size: blueViewSize)
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ThirdViewController.View touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ThirdViewController.View touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ThirdViewController.View touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ThirdViewController.View touchesCancelled")
    }
    
}
