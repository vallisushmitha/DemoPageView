//
//  ImagesPageViewController.swift
//  DemoPageView
//
//  Created by kvanaMini1 on 30/05/16.
//  Copyright © 2016 kvanaMini1. All rights reserved.
//

import UIKit

class ImagesPageViewController: UIViewController {

    
     @IBOutlet var images: UIImageView!
     @IBOutlet var titlelbl: UILabel!
    

    var pageIndex: Int!
    var titleIndex: String!
    var imageIndex: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.images.image = UIImage(named: self.imageIndex)
        self.titlelbl.text = self.titleIndex
        
   

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
 
  
}
