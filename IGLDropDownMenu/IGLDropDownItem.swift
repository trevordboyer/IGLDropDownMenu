//
//  IGLDropDownItem.swift
//  IGLDropDownMenuDemo
//
//  Created by Trevor Boyer on 4/11/15.
//  Copyright (c) 2015 Galvin Li. All rights reserved.
//

import UIKit

class IGLDropDownItem : UIControl {
    
    /* Public vars */
    var index: Int?
    var iconImage: UIImage?
    var object: AnyObject?
    var text: NSString?
    
    var textLabel: UILabel?
    
    var paddingLeft: CGFloat?
    
    /* Private vars */
    
    private var iconImageView: UIImageView?
    private var bgView: UIView?
    
    override init() {
        super.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.paddingLeft = 5
        self.initView()
    }
    
    func setFrame(frame: CGRect) {
        super.frame = frame
        self.bgView!.frame = self.bounds
        self.updateLayout()
    }
    
    private func initView() {
        
        self.bgView = UIView()
        self.bgView!.userInteractionEnabled = false
        self.bgView!.backgroundColor = UIColor.whiteColor()
        self.bgView!.layer.shadowColor = UIColor.grayColor().CGColor
        self.bgView!.layer.shadowOffset = CGSizeMake(0, 0)
        self.bgView!.layer.shadowOpacity = 0.2
        self.bgView!.layer.shouldRasterize = true
        self.bgView!.frame = self.bounds
        self.addSubview(self.bgView!)
        
        self.iconImageView = UIImageView()
        self.iconImageView!.contentMode = .Center
        self.addSubview(self.iconImageView!)
        
        self.textLabel = UILabel()
        self.textLabel!.numberOfLines = 1
        self.textLabel!.textColor = UIColor.grayColor()
        self.addSubview(self.textLabel!)
        
        self.updateLayout()
        
    }
    
    func setIconImage(iconImage: UIImage) {
        self.iconImage = iconImage
        self.iconImageView!.image = self.iconImage
        
        self.updateLayout()
    }
    
    private func updateLayout() {
        
        var selfWidth: CGFloat = CGRectGetWidth(self.bounds)
        var selfHeight: CGFloat = CGRectGetHeight(self.bounds)
        
        self.iconImageView!.frame = CGRectMake(self.paddingLeft!, 0, selfHeight, selfHeight)
        
        if (self.iconImage != nil) {
            self.textLabel!.frame = CGRectMake(CGRectGetMaxX(self.iconImageView!.frame), 0, selfWidth - CGRectGetMaxX(self.iconImageView!.frame), selfHeight)
        } else {
            self.textLabel!.frame = CGRectMake(self.paddingLeft!, 0, selfWidth, selfHeight)
        }
        
    }
    
    func setPaddingLeft(paddingLeft: CGFloat) {
        self.paddingLeft = paddingLeft
        
        self.updateLayout()
    }
    
    func setObject(object: AnyObject?) {
        self.object = object
    }
    
    func setText(text: String) {
        self.text = NSString(string: text)
        self.textLabel!.text = self.text
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject? {
        var itemCopy = IGLDropDownItem()
        
        itemCopy.index = self.index
        itemCopy.iconImage = self.iconImage
        itemCopy.object = self.object
        itemCopy.text = self.text
        itemCopy.paddingLeft = self.paddingLeft
        
        return itemCopy
    }
    
}