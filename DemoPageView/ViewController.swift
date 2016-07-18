
//
//  ViewController.swift
//  DemoPageView
//
//  Created by kvanaMini1 on 30/05/16.
//  Copyright © 2016 kvanaMini1. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource{

    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    self.pageTitles = NSArray(objects: "Screenone", "Screentwo","Screenthree")
        self.pageImages = NSArray(objects: "boxer", "bulldog", "puppy")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController")as! UIPageViewController
    
    self.pageViewController.dataSource = self
        
        let startingViewController = self.viewControllerAtIndex(0)
        let viewControllers: NSArray = [startingViewController]
        self.pageViewController.setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
        
       

      self.pageViewController.didMoveToParentViewController(self)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func restartAction(sender: AnyObject){
        
        var startVC = self.viewControllerAtIndex(0) as ImagesPageViewController
        var viewControllers = NSArray(object:startVC)
        
        self.pageViewController.setViewControllers([startVC], direction:.Forward, animated: true, completion: nil)
    
    }
    
    
    func viewControllerAtIndex(index: Int)-> ImagesPageViewController{
            
            if((self.pageTitles.count==0) || (index >= self.pageTitles.count))
            {
                return ImagesPageViewController()
            }
            
            let vc: ImagesPageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ImagesPageViewController")as! ImagesPageViewController
            vc.imageIndex = self.pageImages[index]as! String
            vc.pageIndex = index
            vc.titleIndex = self.pageTitles[index]as! String
            
            return vc
            
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        
        let vc = viewController as! ImagesPageViewController
        var index = vc.pageIndex as Int
        
        if(index == 0 || index == NSNotFound)
        {
            return nil
        }
        
        index -= 1
    return self.viewControllerAtIndex(index)
      }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        
        let vc = viewController as! ImagesPageViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index += 1
        
        if (index == self.pageTitles.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageImages.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int{
        return 0
    }

}


