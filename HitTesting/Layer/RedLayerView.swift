//
//  RedLayerView.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class RedLayerView: UIView {
    
    let redLayer = RedLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addSublayer(redLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sizing
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size = CGSize(width: 100.0, height: 100.0)
        redLayer.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
        return size
    }

    // Вызывается дважды. ???
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.bounds.contains(point) {
            if let layer = redLayer.hitTest(point) {
                if layer is RedLayer {
                    print("RedLayer hitTest")
                }
                return self
            }
        }
        // С последней вью стоит быть аккуратным при переопределении hitTest
        // Если эта вью добавлена последней и здесь вернуть self этот return сработает если не сработает if выше и никакие нажатия на вьюхи распознаваться не будут. Будет постоянно вызываться этот метод.
        return nil
    }
}
