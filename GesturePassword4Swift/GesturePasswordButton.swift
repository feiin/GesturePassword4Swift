//
//  GesturePasswordButton.swift
//  GesturePassword4Swift
//
//  Created by feiin on 14/11/22.
//  Copyright (c) 2014年 swiftmi. All rights reserved.
//
//  Edited by Glitter on 16/01/12.

import UIKit

class GesturePasswordButton: UIView {

    
    var selected:Bool = false
    
    var success:Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        selected = false
        success = true
        self.backgroundColor = UIColor.clear
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        if(selected){
            if(success){
                
                context.setStrokeColor(red: 2/225, green: 174/255, blue: 240/255, alpha: 1) //线条颜色
                context.setFillColor(red: 2/225, green: 174/255, blue: 240/255, alpha: 1)
                
            }else{
            
                context.setStrokeColor(red: 208/255, green: 36/255, blue: 36/255,alpha: 1);//线条颜色
                context.setFillColor(red: 208/255, green: 36/255, blue: 36/255,alpha: 1);
            }
            
            let frame:CGRect = CGRect(x: bounds.size.width/2-bounds.size.width/8+1, y: bounds.size.height/2-bounds.size.height/8, width: bounds.size.width/4, height: bounds.size.height/4);
            
            context.addEllipse(in: frame);
            context.fillPath();

        }else{
            
            context.setStrokeColor(red: 1,green: 1,blue: 1,alpha: 1);//线条颜色

        }
   
        context.setLineWidth(2)
        
        let frame:CGRect = CGRect(x: 2, y: 2, width: bounds.size.width-3, height: bounds.size.height-3)
        context.addEllipse(in: frame)
        
        context.strokePath()
        
        if(success){
             context.setFillColor(red: 30/225, green: 175/255, blue: 235/255, alpha: 0.3)
        }else{
            context.setFillColor(red: 208/225, green: 36/255, blue: 36/255, alpha: 0.3)
        }
        
        context.addEllipse(in: frame)
        
        if(selected){
            
            context.fillPath()
        }
    }
    
   

}
