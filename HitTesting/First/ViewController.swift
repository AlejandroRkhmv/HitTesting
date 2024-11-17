//
//  ViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

// Здесь можно попробовать пропуск нажатий

final class ViewController: UIViewController {
    
    let mainRedView = MainRedView()
    let topRedView = TopRedView()
    let bottomRedView = BottomRedView()
    
    let mainGreenView = MainGreenView()
    let topGreenView = TopGreenView()
    let bottomGreenView = BottomGreenView()
    
    let mainGrayView = MainGrayView()
    let leftGrayView = LeftGrayView()
    let rightGrayView = RightGrayView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupRedViews()
        setupGreenViews()
        setupGrayViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutRedViews()
        layoutGreenViews()
        layoutGrayViews()
    }
    
    // MARK: - Red
    
    private func setupRedViews() {
        view.addSubview(mainRedView)
        mainRedView.addSubview(topRedView)
        mainRedView.addSubview(bottomRedView)
    }
    
    private func layoutRedViews() {
        let mainRedViewSize = mainRedView.sizeThatFits(view.bounds.size)
        let mainRedViewOrigin = CGPoint(x: 25.0, y: 50.0)
        mainRedView.frame = CGRect(origin: mainRedViewOrigin, size: mainRedViewSize)
        
        let topRedViewSize = topRedView.sizeThatFits(mainRedView.bounds.size)
        let topRedViewOrigin = CGPoint(x: 15.0, y: 15.0)
        topRedView.frame = CGRect(origin: topRedViewOrigin, size: topRedViewSize)
        
        let bottomRedViewSize = bottomRedView.sizeThatFits(mainRedView.bounds.size)
        let bottomRedViewOrigin = CGPoint(x: 15.0, y: topRedViewSize.height + 30.0)
        bottomRedView.frame = CGRect(origin: bottomRedViewOrigin, size: bottomRedViewSize)
    }
    
    // MARK: - Green
    
    private func setupGreenViews() {
        view.addSubview(mainGreenView)
        mainGreenView.addSubview(topGreenView)
        mainGreenView.addSubview(bottomGreenView)
    }
    
    private func layoutGreenViews() {
        let mainGreenViewSize = mainGreenView.sizeThatFits(view.bounds.size)
        let mainGreenViewOrigin = CGPoint(x: 125.0, y: 200.0)
        mainGreenView.frame = CGRect(origin: mainGreenViewOrigin, size: mainGreenViewSize)
        
        let topGreenViewSize = topGreenView.sizeThatFits(mainGreenView.bounds.size)
        let topGreenViewOrigin = CGPoint(x: 15.0, y: 15.0)
        topGreenView.frame = CGRect(origin: topGreenViewOrigin, size: topGreenViewSize)
        
        let bottomGreenViewSize = bottomGreenView.sizeThatFits(mainGreenView.bounds.size)
        let bottomGreenViewOrigin = CGPoint(x: 15.0, y: topGreenViewSize.height + 30.0)
        bottomGreenView.frame = CGRect(origin: bottomGreenViewOrigin, size: bottomGreenViewSize)
    }
    
    // MARK: - Gray
    
    private func setupGrayViews() {
        view.addSubview(mainGrayView)
        mainGrayView.addSubview(leftGrayView)
        mainGrayView.addSubview(rightGrayView)
    }
    
    private func layoutGrayViews() {
        let mainGrayViewSize = mainGrayView.sizeThatFits(view.bounds.size)
        let mainGrayViewOrigin = CGPoint(x: 15.0, y: 600.0)
        mainGrayView.frame = CGRect(origin: mainGrayViewOrigin, size: mainGrayViewSize)
        
        let leftGrayViewSize = leftGrayView.sizeThatFits(mainGrayView.bounds.size)
        let leftGrayViewOrigin = CGPoint(x: 15.0, y: 15.0)
        leftGrayView.frame = CGRect(origin: leftGrayViewOrigin, size: leftGrayViewSize)
        
        let rightGrayViewSize = rightGrayView.sizeThatFits(mainGrayView.bounds.size)
        let rightGrayViewOrigin = CGPoint(x: leftGrayViewSize.width + 30.0, y: 15.0)
        rightGrayView.frame = CGRect(origin: rightGrayViewOrigin, size: rightGrayViewSize)
    }

    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewController.View touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewController.View touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewController.View touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewController.View touchesCancelled")
    }
    
}

