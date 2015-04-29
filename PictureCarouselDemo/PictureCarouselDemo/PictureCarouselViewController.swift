//
//  ViewController.swift
//  PictureCarouselDemo
//
//  Created by 洪亞偉 on 15/4/29.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit

class PictureCarouselViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pictureContainer: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer = NSTimer()
    var pictureCnt = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pictureContainer.contentSize = CGSizeMake(CGFloat(160 * pictureCnt) - 10, 200)
        pictureContainer.pagingEnabled = true
        addTimer()
        
        
        for i in 0...(pictureCnt-1) {
            var x = CGFloat(i*160)
            var y = (pictureContainer.frame.height - 150) / 2
            var image = UIImageView(frame: CGRectMake(x, y, 150, 150))
            image.contentMode = UIViewContentMode.ScaleAspectFit
            var imageName = String(format: "%.2i", i + 1)
            
            switch i {
                
            case 0: image.image = UIImage(named: imageName)
            case 1: image.image = UIImage(named: imageName)
            case 2: image.image = UIImage(named: imageName)
            case 3: image.image = UIImage(named: imageName)
            case 4: image.image = UIImage(named: imageName)
            case 5: image.image = UIImage(named: imageName)
            case 6: image.image = UIImage(named: imageName)
            case 7: image.image = UIImage(named: imageName)
            case 8: image.image = UIImage(named: imageName)
            case 9: image.image = UIImage(named: imageName)
            case 10: image.image = UIImage(named: imageName)
            case 11: image.image = UIImage(named: imageName)
            case 12: image.image = UIImage(named: imageName)
            case 13: image.image = UIImage(named: imageName)
                
            default:println("Error!")
            }
            
            pictureContainer.addSubview(image)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        var x = scrollView.contentOffset.x
        var page = Int((x / width) + 0.5)
        pageControl.currentPage = page

    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    func addTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "nextPage", userInfo: nil, repeats: true)
    }
    
    func nextPage() {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        
        var page = pageControl.currentPage
        let width = pictureContainer.frame.size.width
        var x = CGFloat(page + 1) * width
        pictureContainer.contentOffset = CGPointMake(x, 0)
        page += 1
        
        UIView.commitAnimations()

        
        if page >= 4 {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.5)
            
            pageControl.currentPage = 0
            pictureContainer.contentOffset = CGPointMake(0, 0)
            
            UIView.commitAnimations()
        }
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    

}

