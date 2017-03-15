//
//  OrderCagegoryTextView.swift
//  BusEasyOrder
//
//  Created by 冯万琦 on 2017/1/6.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class DrawLabelView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let text: NSString = ""
    
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        let font: UIFont = UIFont.systemFont(ofSize: 14)
        let attributes: [String : Any?] = [NSFontAttributeName:font, NSForegroundColorAttributeName:UIColor.blue]
        let size: CGSize = self.text.size(attributes: attributes)
        self.text.draw(at: CGPoint.init(x: 0, y: 0), withAttributes: attributes)

//        [scaleStr drawAtPoint:CGPointMake((MARGIN_LEFT-size.width)-rightMargin, self.frame.size.height-(MARGIN_BOTTOM+_yIntervalInPx*i)-size.height/2) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_themAttributs[bYAxisLabelFontKey],NSFontAttributeName, nil]];
        
        
        //获取上下文
//        CGContextRef context = UIGraphicsGetCurrentContext();
        //设置背景透明
//        CGContextSetFillColorWithColor(context,self.backgroundColor.CGColor);
//        CGContextFillRect(context, rect);
//        GContextSetLineWidth(context, 2);
//        CGContextSetLineCap(context, kCGLineCapSquare);
//        CGContextStrokePath(context);
//        CGContextMoveToPoint(context,centerPoint.x+[self parseToX:radius Angle:currentAngle], centerPoint.y+[self parseToY:radius Angle:currentAngle]);
//        CGContextAddLineToPoint(context,centerPoint.x+[self parseToX:radius*(1-LINEWIDTHRAGE) Angle:currentAngle], centerPoint.y+[self parseToY:radius*(1-LINEWIDTHRAGE) Angle:currentAngle]);
    }
}
