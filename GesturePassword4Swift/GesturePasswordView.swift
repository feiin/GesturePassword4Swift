//
//  GesturePasswordView.swift
//  GesturePassword4Swift
//
//  Created by feiin on 14/11/22.
//  Copyright (c) 2014年 swiftmi. All rights reserved.
//
//  Edited by Glitter on 16/01/12.

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
    
   fileprivate var buttonArray:[GesturePasswordButton]=[]
    
   fileprivate var lineStartPoint:CGPoint?
   fileprivate var lineEndPoint:CGPoint?

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Initialization code
      
        let view = UIView(frame:CGRect(x: frame.size.width/2-160, y: frame.size.height/2-80, width: 320, height: 320))
        
        for i in 0..<9 {
            
            let row = Int(i/3)
            let col = Int(i%3)
            
            let distance = Int(320/3)
            let size:Int = Int(Float(distance)/1.5)
            let margin = Int(size/4)
            
            let gesturePasswordButton = GesturePasswordButton(frame: CGRect(x: CGFloat(col*distance+margin), y: CGFloat(row*distance), width: CGFloat(size), height: CGFloat(size)))
            
            gesturePasswordButton.tag = i
            
            view.addSubview(gesturePasswordButton)
            buttonArray.append(gesturePasswordButton)
            
        }
        
        
        self.addSubview(view)
        
        tentacleView = TentacleView(frame: view.frame)
  
        tentacleView!.buttonArray = buttonArray
        tentacleView!.touchBeginDelegate = self
        self.addSubview(tentacleView!)
        
        state = UILabel(frame: CGRect(x: frame.size.width/2-140, y: frame.size.height/2-120, width: 280, height: 30))
        state!.textAlignment = NSTextAlignment.center
        state!.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(state!)
        
        imgView = UIImageView(frame:CGRect(x: frame.size.width/2-35, y: frame.size.width/2-80, width: 70, height: 70))
        imgView?.backgroundColor = UIColor.white
        imgView!.layer.cornerRadius = 35
        imgView!.layer.borderColor = UIColor.gray.cgColor
        imgView!.layer.borderWidth = 3
        self.addSubview(imgView!)
        
        forgetButton = UIButton(frame:CGRect(x: frame.size.width/2-150, y: frame.size.height/2+220, width: 120, height: 30))
        forgetButton!.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgetButton!.setTitleColor(UIColor.white, for: UIControlState())
        forgetButton!.setTitle("忘记手势密码", for: UIControlState())
        forgetButton!.addTarget(self, action: #selector(GesturePasswordView.forget), for: UIControlEvents.touchDown)
        self.addSubview(forgetButton!)

        
        changeButton = UIButton(frame:CGRect(x: frame.size.width/2+30, y: frame.size.height/2+220, width: 120, height: 30))
        changeButton!.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        changeButton!.setTitleColor(UIColor.white, for: UIControlState())
        changeButton!.setTitle("修改手势密码", for: UIControlState())
        changeButton!.addTarget(self, action: #selector(GesturePasswordView.change), for: UIControlEvents.touchDown)
        self.addSubview(changeButton!)
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
    
        super.init(coder: aDecoder)
    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext();
        
        let rgb = CGColorSpaceCreateDeviceRGB();
        let colors:[CGFloat] = [134/255,157/255,147/255,1.0,3/255,3/255,37/255,1.0]
      
        let  nilUnsafePointer:UnsafePointer<CGFloat>? = nil
        
        let gradient = CGGradient(colorSpace: rgb, colorComponents: colors, locations: nilUnsafePointer,count: 2)
        
        //CGGradientDrawingOptions()
     
        context?.drawLinearGradient(gradient!, start: CGPoint(x: 0.0,y: 0.0),end: CGPoint(x: 0.0,y: self.frame.size.height), options: [])
        
        
        
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
