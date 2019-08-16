//
//  ViewController.swift
//  UILabelZoom
//
//  Created by Ahmed Khalaf on 7/26/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

class TiledLabel: UILabel {
    override class var layerClass: AnyClass {
        return CATiledLayer.self
    }
}

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus, nulla ac congue scelerisque, sapien velit mattis dolor, sit amet fringilla arcu est eget massa. Proin feugiat enim vel eleifend commodo. In vestibulum purus quis quam posuere, at vehicula nisl finibus. Praesent varius libero elit, et rutrum nisl tempor ut. Quisque lacus velit, aliquam eget mollis et, tempor tempor est. Curabitur vulputate felis vitae metus consequat, eu vehicula nibh fermentum. Nam nibh odio, malesuada eu dictum sit amet, tempus non massa. Aliquam vestibulum suscipit velit. Pellentesque pretium quis purus ac sollicitudin. Morbi mollis arcu quis justo sodales imperdiet. Donec condimentum sapien laoreet, lobortis arcu a, scelerisque massa. Nunc vulputate lorem vitae ipsum posuere, vel sagittis ex efficitur. Mauris maximus diam non sapien cursus, sit amet volutpat ex sagittis. Aliquam suscipit, libero vel posuere tempor, justo massa aliquam risus, vel viverra tellus urna eget urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
        """
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 30
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.scrollView.setZoomScale(self.scrollView.maximumZoomScale * 0.6, animated: true)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return label
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
//        label.layer.contentsScale = scale
        label.contentScaleFactor = scale
        label.setNeedsDisplay()
    }
    
}
