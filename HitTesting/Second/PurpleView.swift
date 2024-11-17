//
//  PurpleView.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class PurpleView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        layer.cornerRadius = 12.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sizing
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 200.0, height: 200.0)
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("PurpleView touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("PurpleView touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("PurpleView touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("PurpleView touchesCancelled")
    }
    
    // MARK: - Убирает область нажатия фиолетовой вью. Так как размер со всех сторон 100. А ширина 200.
    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let margin: CGFloat = 100.0
//        let touchesArea = bounds.insetBy(dx: margin, dy: margin)
//        return touchesArea.contains(point)
//    }
    
    // MARK: - Увеличивает область нажатия фиолетовой вью на 100 поинтов во все стороны
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let margin: CGFloat = 100.0
        let touchesArea = bounds.insetBy(dx: -margin, dy: -margin)
        return touchesArea.contains(point)
    }
    
    // MARK: - Обманывает и говорит что point не содержится в bounds возвращая false
    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        return false
//    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        if bounds.contains(point) {
//            print("PurpleView")
//            return self
//        }
//        return super.hitTest(point, with: event)
//    }
    
}

