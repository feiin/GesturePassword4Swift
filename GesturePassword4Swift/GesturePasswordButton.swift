//
//  GesturePasswordButton.swift
//  GesturePassword4Swift
//
//  Created by feiin on 14/11/22.
//  Copyright (c) 2014年 swiftmi. All rights reserved.
//

import UIKit

class GesturePasswordButton: UIView {

    
    var selected:Bool = false
    
    var success:Bool = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        selected = false
        success = true
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        var context:CGContextRef = UIGraphicsGetCurrentContext()
        
        if(selected){
            if(success){
                
                CGContextSetRGBStrokeColor(context, 2/225, 174/255, 240/255, 1) //线条颜色
                CGContextSetRGBFillColor(context, 2/225, 174/255, 240/255, 1)
                
            }else{
            
                CGContextSetRGBStrokeColor(context, 208/255, 36/255, 36/255,1);//线条颜色
                CGContextSetRGBFillColor(context,208/255, 36/255, 36/255,1);
            }
            
            var frame:CGRect = CGRectMake(bounds.size.width/2-bounds.size.width/8+1, bounds.size.height/2-bounds.size.height/8, bounds.size.width/4, bounds.size.height/4);
            
            CGContextAddEllipseInRect(context,frame);
            CGContextFillPath(context);

        }else{
            
            CGContextSetRGBStrokeColor(context, 1,1,1,1);//线条颜色

        }
   
        CGContextSetLineWidth(context, 2)
        
        var frame:CGRect = CGRectMake(2, 2, bounds.size.width-3, bounds.size.height-3)
        CGContextAddEllipseInRect(context, frame)
        
        CGContextStrokePath(context)
        
        if(success){
             CGContextSetRGBFillColor(context, 30/225, 175/255, 235/255, 0.3)
        }else{
            CGContextSetRGBFillColor(context, 208/225, 36/255, 36/255, 0.3)
        }
        
        CGContextAddEllipseInRect(context, frame)
        
        if(selected){
            
            CGContextFillPath(context)
        }
    }
    
   

}
