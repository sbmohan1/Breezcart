//
//  ViewController.swift
//  MengProject
//
//  Created by Sishir Mohan on 1/10/17.
//  Copyright © 2017 Sishir Mohan. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //load Nib files
        
        let scannerView = ScannerViewController(nibName: "ScannerViewController", bundle: nil)
        let profileView = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        let cartView = CartViewController(nibName: "CartViewController", bundle: nil)
        
        //let profileView = ProfileViewController
        
        
        //View that scans barcode
        self.addChildViewController(scannerView)
        self.scrollView!.addSubview(scannerView.view)
        scannerView.didMove(toParentViewController: self)
        
        //account profile user view
        self.addChildViewController(profileView)
        self.scrollView!.addSubview(profileView.view)
        profileView.didMove(toParentViewController: self)
        
        //cart view (items added to cart)
        self.addChildViewController(cartView)
        self.scrollView!.addSubview(cartView.view)
        cartView.didMove(toParentViewController: self)
        
        //create the frames to set up the views
        var frame1 = profileView.view.frame
        frame1.origin.x = self.view.frame.size.width
        scannerView.view.frame = frame1
        
        var scanFrame = scannerView.view.frame
        scanFrame.origin.x = self.view.frame.width*2
        cartView.view.frame = scanFrame
        
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        
        scrollView.contentOffset = CGPoint(x: frame1.origin.x, y: frame1.origin.y)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

