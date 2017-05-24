//
//  TerraaLoader.swift
//  Loader
//
//  Created by Divum Corporate Services on 04/11/16.
//  Copyright © 2016 Divum Corporate Services. All rights reserved.
//

import UIKit
import SpriteKit

//var CustomLoaderView : UnsafePointer<UIView>?    =   nil

// Do not use this tag anywhere else
let LoaderBgViewTag = 14455


extension UIView {
    
    func addCustomLoader(adjustNavBar adjust: Bool) {
        
        //let existingLoaderView : UIView? = objc_getAssociatedObject(self, &CustomLoaderView) as? UIView
        //if existingLoaderView != nil { return }
        
        if let loaderView = self.viewWithTag(LoaderBgViewTag) {
            loaderView.removeFromSuperview()
        }
        
        
        var frame = UIScreen.main.bounds
        
        if adjust {
            
            frame.origin.y = 64
        }
        
        
        let loaderView = UIView(frame: frame)
        loaderView.backgroundColor = UIColor.clear
        loaderView.tag = LoaderBgViewTag
        
        //        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        //        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //        blurEffectView.frame = loaderView.bounds
        //        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        //        loaderView.addSubview(blurEffectView)
        
        let loaderBgView = UIView()
        loaderBgView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        loaderBgView.center = CGPoint(x: loaderView.bounds.size.width / 2, y: loaderView.bounds.size.height / 2 - 64)
        loaderBgView.backgroundColor = UIColor.lightGray
        
        loaderBgView.layer.masksToBounds = true
        loaderBgView.layer.cornerRadius = 10.0
        loaderView.addSubview(loaderBgView)
        
        //        let loader = BLMultiColorLoader(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        //        loader.lineWidth = 2.0
        //        loader.colorArray = [UIColor.blue , UIColor.green , UIColor.red]
        //        loader.startAnimation()
        //        loaderBgView.addSubview(loader)
        loaderView.alpha = 0.0
        
        
        let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        activityIndicator.frame = CGRect.init(x: 10, y: 10, width: 30, height: 30)
        activityIndicator.startAnimating()
        loaderBgView.addSubview(activityIndicator)
        
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        self.addSubview(loaderView)
                        loaderView.alpha = 1.0
            },
                       completion: { (finished: Bool) in
                        //objc_setAssociatedObject(self, &CustomLoaderView, loaderView, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        })
        
    }
    
    func removeCustomLoader() {
        
        // let existingLoaderView = objc_getAssociatedObject(self, &CustomLoaderView) as! UIView?
        //if existingLoaderView == nil { return }
        
        
        let loaderView = self.viewWithTag(LoaderBgViewTag)
        
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        loaderView?.alpha = 0.0
            },
                       completion: { (finished: Bool) in
                        
                        loaderView?.removeFromSuperview()
                        //objc_setAssociatedObject(self, &CustomLoaderView, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        })
        
    }
}
