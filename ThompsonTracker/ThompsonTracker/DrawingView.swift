//
//  GraphView.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/21/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import UIKit

class DrawingView: UIView {
    
    var startColor: UIColor = UIColor.blue
    var endColor: UIColor = UIColor.green
    var lineColor: UIColor = UIColor.white
    var dotColor: UIColor = UIColor.black
    var horizontalLineColor: UIColor = UIColor.black
    
    var graphPoints: [Int] = [0]
    
    //    init(frame: CGRect, graphPoints: [Int]) {
    //
    //        //NEED TO ADD OTHER COLOR VALUES INTO CONSTRUCTOR?
    //        self.graphPoints = graphPoints
    //
    //        super.init(frame: frame)
    //
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    //    init(frame: CGRect, graphPoints: [Int], startColor: UIColor, endColor: UIColor, lineColor: UIColor, dotColor: UIColor, horizontalLineColor: UIColor, axisColor: UIColor) {
    //        self.startColor = startColor
    //        self.endColor = endColor
    //        self.lineColor = lineColor
    //        self.dotColor = dotColor
    //        self.horizontalLineColor = horizontalLineColor
    //        self.axisColor = axisColor
    //        self.graphPoints = graphPoints
    //
    //        super.init(frame: frame)
    //    }
    
    override func draw(_ rect: CGRect) {
        
        //print(graphPoints)
        
        let width = rect.width
        let height = rect.height
        
        //set up background clipping area
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: UIRectCorner.allCorners,
                                cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        //2 - get the current context
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        let colors = [startColor.cgColor, endColor.cgColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        context.drawLinearGradient(gradient!,
                                   start: startPoint,
                                   end: endPoint,
                                   options: CGGradientDrawingOptions(rawValue: 0))
    }
}
