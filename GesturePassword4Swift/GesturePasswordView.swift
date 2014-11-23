//
//  GesturePasswordView.swift
//  GesturePassword4Swift
//
//  Created by feiin on 14/11/22.
//  Copyright (c) 2014年 swiftmi. All rights reserved.
//

import UIKit

protocol GesturePasswordDelegate
{
    func forget()
    func change()
}

class GesturePasswordView: UIView,TouchBeginDelegate {

    var tentacleView:TentacleView?
    
    var state:UILabel?
    
    var gesturePasswordDelegate:GesturePasswordDelegate?
    
    var imgView:UIImageView?
    
    var forgetButton:UIButton?
    
    var changeButton:UIButton?
    
   private var buttonArray:[GesturePasswordButton]=[]
    
   private var lineStartPoint:CGPoint?
   private var lineEndPoint:CGPoint?

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Initialization code
      
        var view = UIView(frame:CGRectMake(frame.size.width/2-160, frame.size.height/2-80, 320, 320))
        
        for i in 0..<9 {
            
            var row = Int(i/3)
            var col = Int(i%3)
            
            var distance = Int(320/3)
            var size:Int = Int(Float(distance)/1.5)
            var margin = Int(size/4)
            
            var gesturePasswordButton = GesturePasswordButton(frame: CGRectMake(CGFloat(col*distance+margin), CGFloat(row*distance), CGFloat(size), CGFloat(size)))
            
            gesturePasswordButton.tag = i
            
            view.addSubview(gesturePasswordButton)
            buttonArray.append(gesturePasswordButton)
            
        }
        
        
        self.addSubview(view)
        
        tentacleView = TentacleView(frame: view.frame)
  
        tentacleView!.buttonArray = buttonArray
        tentacleView!.touchBeginDelegate = self
        self.addSubview(tentacleView!)
        
        state = UILabel(frame: CGRectMake(frame.size.width/2-140, frame.size.height/2-120, 280, 30))
        state!.textAlignment = NSTextAlignment.Center
        state!.font = UIFont.systemFontOfSize(14)
        self.addSubview(state!)
        
        imgView = UIImageView(frame:CGRectMake(frame.size.width/2-35, frame.size.width/2-80, 70, 70))
        imgView?.backgroundColor = UIColor.whiteColor()
        imgView!.layer.cornerRadius = 35
        imgView!.layer.borderColor = UIColor.grayColor().CGColor
        imgView!.layer.borderWidth = 3
        self.addSubview(imgView!)
        
        forgetButton = UIButton(frame:CGRectMake(frame.size.width/2-150, frame.size.height/2+220, 120, 30))
        forgetButton!.titleLabel?.font = UIFont.systemFontOfSize(14)
        forgetButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        forgetButton!.setTitle("忘记手势密码", forState: UIControlState.Normal)
        forgetButton!.addTarget(self, action: Selector("forget"), forControlEvents: UIControlEvents.TouchDown)
        self.addSubview(forgetButton!)

        
        changeButton = UIButton(frame:CGRectMake(frame.size.width/2+30, frame.size.height/2+220, 120, 30))
        changeButton!.titleLabel?.font = UIFont.systemFontOfSize(14)
        changeButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        changeButton!.setTitle("修改手势密码", forState: UIControlState.Normal)
        changeButton!.addTarget(self, action: Selector("change"), forControlEvents: UIControlEvents.TouchDown)
        self.addSubview(changeButton!)
        
        
        
    }

    required init(coder aDecoder: NSCoder) {
    
        super.init(coder: aDecoder)
    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        var context = UIGraphicsGetCurrentContext();
        
        var rgb = CGColorSpaceCreateDeviceRGB();
        var colors:[CGFloat] = [134/255,157/255,147/255,1.0,3/255,3/255,37/255,1.0]
      
        var  nilUnsafePointer:UnsafePointer<CGFloat> = nil
        
        var gradient = CGGradientCreateWithColorComponents(rgb, colors, nilUnsafePointer,2)
        
        CGGradientDrawingOptions()
     
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0.0,0.0),CGPointMake(0.0,self.frame.size.height), 0)
        
        
        
    }
    
    
    func gestureTouchBegin(){
        
        self.state!.text = ""
    }
    
    
    func forget(){
        if(gesturePasswordDelegate != nil){
            gesturePasswordDelegate!.forget()
        }
    }
    
    func change(){
        if(gesturePasswordDelegate != nil){
            gesturePasswordDelegate!.change()
        }
    }

}
