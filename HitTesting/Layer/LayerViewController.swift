//
//  LayerViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class LayerViewController: UIViewController {
    
    let cyanView = CyanView()
    let greenLayer = CALayer()
    let redLayer = RedLayer()
    let blueLayer = BlueLayer()
    let redLayerView = RedLayerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCyanViews()
        setupLayers()
        // MARK: - Добавлена последней
        setupRedLayerView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutCyanView()
        layoutLayers()
        layoutRedLayerView()
    }
    
    private func setupCyanViews() {
        view.addSubview(cyanView)
    }
    
    private func setupLayers() {
        greenLayer.backgroundColor = UIColor.green.cgColor
        cyanView.layer.addSublayer(greenLayer)
        cyanView.layer.addSublayer(redLayer)
        cyanView.layer.addSublayer(blueLayer)
    }
    
    private func setupRedLayerView() {
        view.addSubview(redLayerView)
    }
    
    private func layoutCyanView() {
        let cyanViewSize = cyanView.sizeThatFits(view.bounds.size)
        let cyanViewOrigin = CGPoint(
            x: view.center.x - cyanViewSize.width / 2.0,
            y: view.center.y - cyanViewSize.height / 2.0
        )
        cyanView.frame = CGRect(origin: cyanViewOrigin, size: cyanViewSize)
    }
    
    private func layoutLayers() {
        greenLayer.frame = CGRect(x: 40, y: 10, width: 50, height: 50)
        redLayer.frame = CGRect(x: 10, y: 50, width: 50, height: 50)
        blueLayer.frame = CGRect(x: 60, y: 90, width: 50, height: 50)
    }
    
    private func layoutRedLayerView() {
        let redLayerViewSize = redLayerView.sizeThatFits(view.bounds.size)
        let redLayerViewOrigin = CGPoint(x: 50.0, y: 50.0)
        redLayerView.frame = CGRect(origin: redLayerViewOrigin, size: redLayerViewSize)
    }

    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("LayerViewController.View touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("LayerViewController.View touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("LayerViewController.View touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("LayerViewController.View touchesCancelled")
    }

}
