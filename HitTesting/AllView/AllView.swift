//
//  AllView.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class AllView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .magenta
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllView touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllView touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllView touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AllView touchesCancelled")
    }
    
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        if bounds.contains(point) {
//            print("AllView")
//            return self
//        }
//        return super.hitTest(point, with: event)
//    }
    
    // Вызывается также дважды.
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        // Но отдает false и ничего не происходит
        print(#function)
        return false
    }
    
}
