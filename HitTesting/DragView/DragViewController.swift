//
//  DragViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 10.11.2024.
//

import UIKit

final class DragViewController: UIViewController {
    
    private let redDragView = RedDragView()
    private var pointOfTouch: CGPoint = .zero
    private var deltaPoint: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupRedDragView()
        layoutRedDragView()
    }
       
    private func setupRedDragView() {
        view.addSubview(redDragView)
    }
    
    private func layoutRedDragView() {
        let redDragViewSize = redDragView.sizeThatFits(view.bounds.size)
        let redDragViewOrigin = CGPoint(x: view.center.x - redDragViewSize.width / 2.0, y: view.center.y - redDragViewSize.height / 2.0)
        redDragView.frame = CGRect(origin: redDragViewOrigin, size: redDragViewSize)
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("DragViewController.View touchesBegan")
        let countOfTouches = touches.count
        guard 1 == countOfTouches else { return }
        guard let point = touches.first?.location(in: self.view) else { return }
        guard let view = view.hitTest(point, with: event) else { return }
        
        if view.isEqual(redDragView) {
            guard let pointInRedDragView = touches.first?.location(in: self.view) else { return }
            deltaPoint = CGPoint(x: redDragView.center.x - pointInRedDragView.x, y: redDragView.center.y - pointInRedDragView.y)
            
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self else { return }
                redDragView.layer.transform = CATransform3DIdentity
                redDragView.layer.transform = CATransform3DScale(redDragView.layer.transform, 1.1, 1.1, 1.1)
                redDragView.backgroundColor = .red.withAlphaComponent(1.0)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("DragViewController.View touchesMoved")
        let countOfTouches = touches.count
        guard 1 == countOfTouches else { return }
        guard let point = touches.first?.location(in: self.view) else { return }
        guard let view = view.hitTest(point, with: event) else { return }
        
        
        if view.isEqual(redDragView) {
            guard let pointInRedDragView = touches.first?.location(in: self.view) else { return }
            pointOfTouch = CGPoint(x: pointInRedDragView.x + deltaPoint.x, y: pointInRedDragView.y + deltaPoint.y)
            UIView.animate(withDuration: 0.01) { [weak self] in
                guard let self else { return }
                redDragView.center = pointOfTouch
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("DragViewController.View touchesEnded")
        let countOfTouches = touches.count
        guard 1 == countOfTouches else { return }
        guard let pointInRedDragView = touches.first?.location(in: self.view) else { return }
        pointOfTouch = CGPoint(x: pointInRedDragView.x + deltaPoint.x, y: pointInRedDragView.y + deltaPoint.y)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            redDragView.layer.transform = CATransform3DIdentity
            redDragView.backgroundColor = .red.withAlphaComponent(0.5)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("DragViewController.View touchesCancelled")
    }
}

