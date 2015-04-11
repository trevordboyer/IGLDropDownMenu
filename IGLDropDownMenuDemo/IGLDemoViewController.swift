//
//  IGLDemoViewController.swift
//  IGLDropDownMenuDemo
//
//  Created by Trevor Boyer on 4/11/15.
//  Copyright (c) 2015 Galvin Li. All rights reserved.
//

import UIKit

class IGLDemoViewController : UIViewController, IGLDropDownMenuDelegate {
    
    private var dropDownMenu: IGLDropDownMenu?
    private var textLabel: UILabel?
    
    override init(nibName nibNameOrNil: NSString, bundle nibBundleOrNil: NSBundle) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var segmentedControl: UISegmentedControl = UISegmentedControl(items: [ "Demo1", "Demo2", "Demo3", "Demo4", "Demo5", "Demo6" ] )
        segmentedControl.setFrame(CGRectMake(10, 25, 300, 30))
        segmentedControl.addTarget(self, action: Selector("segmentChanged:"), forControlEvents:.ValueChanged)
        segmentedControl.setSelectedSegmentIndex(0)
        self.view.addSubview(segmentedControl)
        
        var dataArray =  [ [ "image" : "sun.png", "title" : "Sun" ],
            [ "image" : "clouds.png", "title" : "Clouds"],
            [ "image" : "snow.png", "title" : "Snow" ],
            [ "image" : "rain.png", "title" : "Rain" ],
            [ "image" : "windy.png", "title" : "Windy" ] ]
        
        var dropdownItems: NSMutableArray = NSMutableArray()
        
        for i in 0 ..< dataArray.count {
            var dict: NSDictionary = dataArray[i]
            
            var item: IGLDropDownItem = IGLDropDownItem()
            item.setIconImage(UIImage(named: dict["image"]))
            item.setText(dict["title"])
            dropdownItems.addObject(item)
        }
        
        self.dropDownMenu = IGLDropDownMenu()
        self.dropDownMenu.menuText = "Choose Weather"
        self.dropDownMenu.dropDownItems = dropdownItems
        self.dropDownMenu.paddingLeft = 15
        self.dropDownMenu.setFrame(CGRectMake(60, 100, 200, 45))
        self.dropDownMenu.delegate = self
        
        // You can use block instead of delegate if you want
        /*
        __weak typeof(self) weakSelf = self;
        [self.dropDownMenu addSelectedItemChangeBlock:^(NSInteger selectedIndex) {
        __strong typeof(self) strongSelf = weakSelf;
        IGLDropDownItem *item = strongSelf.dropDownMenu.dropDownItems[selectedIndex];
        strongSelf.textLabel.text = [NSString stringWithFormat:@"Selected: %@", item.text];
        }];
        */
        
        self.setUpParamsForDemo1()
        
        self.dropDownMenu.reloadView()
        
        self.view.addSubview(self.dropDownMenu)
        
        self.textLabel = UILabel(frame: CGRectMake(0, 50, 320, 50))
        self.textLabel.textAlignment = .Center
        self.view.addSubview(self.textLabel)
        self.textLabel.text = "No Selection."
        
    }
    
    
    func segmentChanged(segment: UISegmentedControl) {
        
        var index = segment.selectedSegmentIndex
        self.dropDownMenu.resetParams()
        switch (index) {
        case 0:
            // Demo 1
            self.setUpParamsForDemo1()
            break
        case 1:
            // Demo 2
            self.setUpParamsForDemo2()
            break
        case 2:
            // Demo 3
            self.setUpParamsForDemo3()
            break
        case 3:
            // Demo 4
            self.setUpParamsForDemo4()
            break
        case 4:
            // Demo 5
            self.setUpParamsForDemo5()
            break
        case 5:
            // Demo 6
            self.setUpParamsForDemo6()
            break
        default:
            break
        }
        self.dropDownMenu.reloadView()
        self.textLabel.text = "No Selection."
    }
    
    func setUpParamsForDemo1() {
        self.dropDownMenu.type = .Stack
        self.dropDownMenu.gutterY = 5
    }
    
    func setUpParamsForDemo2() {
        self.dropDownMenu.type = .Stack
        self.dropDownMenu.gutterY = 5
        self.dropDownMenu.itemAnimationDelay = 0.1
        self.dropDownMenu.rotate = .Random
    }
    
    func setUpParamsForDemo3() {
        self.dropDownMenu.type = .Stack
        self.dropDownMenu.gutterY = 5
        self.dropDownMenu.itemAnimationDelay = 0.04
        self.dropDownMenu.rotate = .Left
    }
    
    func setUpParamsForDemo4() {
        self.dropDownMenu.type = .Stack
        self.dropDownMenu.flipWhenToggleView = true
    }
    
    func setUpParamsForDemo5() {
        self.dropDownMenu.gutterY = 5
        self.dropDownMenu.type = .SlidingInBoth
    }
    
    func setUpParamsForDemo6() {
        self.dropDownMenu.gutterY = 5
        self.dropDownMenu.type = .SlidingInBoth
        self.dropDownMenu.itemAnimationDelay = 0.1
    }
    
    // MARK: - IGLDropDownMenuDelegate
    
    func dropDownMenu(dropDownMenu: IGLDropDownMenu, selectedItemAtIndex index: Int) {
        var item: IGLDropDownItem = dropDownMenu.dropDownItems[index]
        self.textLabel.text = "Selected: \(item.text)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}