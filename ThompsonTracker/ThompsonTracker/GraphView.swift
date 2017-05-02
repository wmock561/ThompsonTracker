
//
//  GraphView.swift
//  ThompsonTracker
//
//  Created by Will Mock on 4/21/17.
//  Copyright © 2017 Will Mock. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class GraphView: UIView {
    var data = NSMutableArray()
    fileprivate var context : CGContext?
    
    fileprivate let padding     : CGFloat = 30
    fileprivate var graphWidth  : CGFloat = 0
    fileprivate var graphHeight : CGFloat = 0
    fileprivate var axisWidth   : CGFloat = 0
    fileprivate var axisHeight  : CGFloat = 0
    fileprivate var everest     : CGFloat = 5
    static var graphPoints = [Int]()
    
    var counter = 0
    
    //#69F6D3 convert to hex for first color
    //69C1D3
    var startColor = UIColor(red: CGFloat(0x69)/255
        ,green: CGFloat(0xF6)/255
        ,blue: CGFloat(0xD3)/255
        ,alpha: 1.0)
    var endColor = UIColor(red: CGFloat(0x69)/255
        ,green: CGFloat(0xC1)/255
        ,blue: CGFloat(0xD3)/255
        ,alpha: 1.0)
   // @IBInspectable var startColor: UIColor = UIColor.red
    //@IBInspectable var endColor: UIColor = UIColor.green
    
    var average: Double = Double(GraphView.graphPoints.reduce(0, +)) / Double(GraphView.graphPoints.count)
    
    
    
    // Graph Styles
    var showLines   = true
    var showPoints  = true
    // var linesColor  = UIColor.init(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
    var linesColor = UIColor.white
    var graphColor  = UIColor.white
    var labelFont   = UIFont.systemFont(ofSize: 10)
    var labelColor  = UIColor.black
    var xAxisColor  = UIColor.init(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
    var yAxisColor  = UIColor.black
    
    
    let clearColor = UIColor.clear
    var xMargin         : CGFloat = 20
    var originLabelText = ""
    var originLabelColor = UIColor.white
    
    required init(coder: NSCoder) {
        super.init(coder:coder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    init(frame: CGRect, data: NSArray) {
        
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.data = data.mutableCopy() as! NSMutableArray
        
        
        
        
    }
    
    
    override func draw(_ rect: CGRect) {
        
        
        super.draw(rect)
        
        
        
        context = UIGraphicsGetCurrentContext()
        
        
        
        
        
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
        //        var startPoint = CGPoint.zero
        //        var endPoint = CGPoint(x:0, y:self.bounds.height)
        //Original gradient above ^^^
        
        graphWidth = (rect.size.width - padding) - 10
        graphHeight = rect.size.height - 40
        axisWidth = rect.size.width - 10
        axisHeight = (rect.size.height - padding) - 10
        
        
        
        
        let startPoint = CGPoint(x: padding, y: 5)
        let endPoint = CGPoint(x: axisWidth + 10 , y: axisHeight + 5)
        
        context?.addRect(CGRect(origin: startPoint, size: CGSize(width: axisWidth - 30, height: axisHeight + 5)))
        
        context?.clip()
        
        context?.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: CGGradientDrawingOptions(rawValue: 0))
        
        
        
    
        
        // Lets work out the highest value and round to the nearest 25.
        // This will be used to work out the position of each value
        // on the Y axis, it essentialy reperesents 100% of Y
        for point in data {
            let n : Int = ((point as AnyObject).object(forKey: "value") as! NSNumber).intValue
            if CGFloat(n) > everest {
                everest = CGFloat(Int(ceilf(Float(n) / 25) * 25))
            }
        }
        if everest == 0 {
            everest = 25
        }
        
        // Draw graph X-AXIS
        let xAxisPath = CGMutablePath()
        xAxisPath.move(to: CGPoint(x: padding, y: rect.size.height - 31))
        xAxisPath.addLine(to: CGPoint(x: axisWidth, y: rect.size.height - 31))
        context?.addPath(xAxisPath)
        
        context?.setStrokeColor(xAxisColor.cgColor)
        context?.strokePath()
        
        // Draw graph Y-AXIS
        let yAxisPath = CGMutablePath()
        yAxisPath.move(to: CGPoint(x: padding, y: 10))
        yAxisPath.addLine(to: CGPoint(x: padding, y: rect.size.height - 31))
        yAxisPath.move(to: CGPoint(x: axisWidth, y: 10))
        yAxisPath.addLine(to: CGPoint(x: axisWidth, y: rect.size.height - 31))
        context?.addPath(yAxisPath)
        
        context?.setStrokeColor(yAxisColor.cgColor)
        context?.strokePath()
        
        // Draw y axis labels and lines
        let yLabelInterval : Int = Int(everest / 5)
        for i in 0...5 {
            
            let label = axisLabel(NSString(format: "%d", i * yLabelInterval))
            label.frame = CGRect(x: 0, y: floor((rect.size.height - padding) - CGFloat(i) * (axisHeight / 5) - 10), width: 20, height: 20)
            label.backgroundColor = UIColor.clear
            addSubview(label)
            
            if(showLines && i != 0) {
                let line = CGMutablePath()
                line.move(to: CGPoint(x: padding + 1, y: floor(rect.size.height - padding) - (CGFloat(i) * (axisHeight / 5))))
                line.addLine(to: CGPoint(x: axisWidth, y: floor(rect.size.height - padding) - (CGFloat(i) * (axisHeight / 5))))
                context?.addPath(line)
                context?.setStrokeColor(linesColor.cgColor)
                context?.strokePath()
            }
        }
        
        // Lets move to the first point
        let pointPath = CGMutablePath()
        let firstPoint = (data[0] as! NSDictionary).object(forKey: "value") as! NSNumber
        let initialY : CGFloat = ceil((CGFloat(firstPoint.intValue as Int) * (axisHeight / everest))) - 10
        let initialX : CGFloat = padding + xMargin
        pointPath.move(to: CGPoint(x: initialX, y: graphHeight - initialY))
        
        // Loop over the remaining values
        for point in data {
            plotPoint(point as! NSDictionary, path: pointPath)
        }
        
        // Set stroke colours and stroke the values path
        context?.addPath(pointPath)
        context?.setLineWidth(2)
        context?.setStrokeColor(graphColor.cgColor)
        context?.strokePath()
        
        // Add Origin Label
        let originLabel = UILabel()
        originLabel.text = originLabelText
        originLabel.textAlignment = NSTextAlignment.center
        originLabel.font = labelFont
        originLabel.textColor = originLabelColor
        originLabel.backgroundColor = backgroundColor
        originLabel.frame = CGRect(x: -2, y: graphHeight + 20, width: 40, height: 20)
        originLabel.backgroundColor = UIColor.clear
        addSubview(originLabel)
        
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: axisWidth / 2, y: axisHeight * 1.2)
        label.textAlignment = .center
        let doubleStr = String(format: "Average : %.2f", average)
        label.text = "\(doubleStr)"
        label.font = UIFont.systemFont(ofSize: 10)
        label.backgroundColor = UIColor.clear
        addSubview(label)
        
        
        
        
        
        
    }
    
    
    
    
    
    // Plot a point on the graph
    func plotPoint(_ point : NSDictionary, path: CGMutablePath) {
        
        // work out the distance to draw the remaining points at
        let interval = Int(graphWidth - xMargin * 2) / (data.count - 1);
        
        let pointValue = (point.object(forKey: "value") as! NSNumber).intValue
        
        // Calculate X and Y positions
        let yposition : CGFloat = ceil((CGFloat(pointValue) * (axisHeight / everest))) - 10
        let xposition : CGFloat = CGFloat(interval * (data.index(of: point))) + padding + xMargin
        
        // Draw line to this value
        
        path.addLine(to: CGPoint(x: xposition, y: graphHeight - yposition))
        
        let xLabel = axisLabel(point.object(forKey: "label" + String(counter)) as! NSString)
        counter += 1
        xLabel.frame = CGRect(x: xposition - 17, y: graphHeight + 20, width: 36, height: 20)
        xLabel.textAlignment = NSTextAlignment.center
        xLabel.backgroundColor = UIColor.clear
        addSubview(xLabel)
        
        if(showPoints) {
            // Add a marker for this value
            let pointMarker = valueMarker()
            pointMarker.backgroundColor = clearColor.cgColor
            pointMarker.frame = CGRect(x: xposition - 8, y: CGFloat(ceil(graphHeight - yposition) - 8), width: 16, height: 16)
            layer.addSublayer(pointMarker)
        }
        
        
        
    }
    
    
    // Returns an axis label
    func axisLabel(_ title: NSString) -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.text = title as String
        label.font = labelFont
        label.textColor = labelColor
        label.backgroundColor = backgroundColor
        label.textAlignment = NSTextAlignment.right
        
        return label
    }
    
    
    // Returns a point for plotting
    func valueMarker() -> CALayer {
        let pointMarker = CALayer()
        pointMarker.backgroundColor = backgroundColor?.cgColor
        pointMarker.cornerRadius = 8
        pointMarker.masksToBounds = true
        
        let markerInner = CALayer()
        markerInner.frame = CGRect(x: 3, y: 3, width: 10, height: 10)
        markerInner.cornerRadius = 5
        markerInner.masksToBounds = true
        markerInner.backgroundColor = graphColor.cgColor
        
        pointMarker.addSublayer(markerInner)
        
        return pointMarker
    }
    
    
}
