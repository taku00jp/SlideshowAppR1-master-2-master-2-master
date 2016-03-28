//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 斉藤 on 2016/03/21.
//  Copyright © 2016年 taku.saito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var backbtn: UIButton!

	var scrView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //UIImageに画像の名前を指定します
        let img1 = UIImage(named:"img1.jpg");
        let img2 = UIImage(named:"img2.jpg");
        let img3 = UIImage(named:"img3.jpg");
        
        //UIImageViewにUIIimageを追加
        let imageView1 = UIImageView(image:img1)
        let imageView2 = UIImageView(image:img2)
        let imageView3 = UIImageView(image:img3)
        
        //UIScrollViewを作成します
        let scrView = UIScrollView()
        
        //表示位置 + 1ページ分のサイズ
        scrView.frame = CGRectMake(81, 81, 240, 240)
        
        //全体のサイズ
        scrView.contentSize = CGSizeMake(240*3, 240)
        
        //左右に並べる
        imageView1.frame = CGRectMake(0, 0, 240, 240)
        imageView2.frame = CGRectMake(240, 0, 240, 240)
        imageView3.frame = CGRectMake(480, 0, 240, 240)
        
        
        //viewに追加
        self.view.addSubview(scrView)
        scrView.addSubview(imageView1)
        scrView.addSubview(imageView2)
        scrView.addSubview(imageView3)
        
        // １ページ単位でスクロールさせる
        scrView.pagingEnabled = true
        
        
        //scroll画面の初期位置
        scrView.contentOffset = CGPointMake(0, 0);

		self.scrView = scrView
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    var pageNo = 0
    
    @IBAction func nextbtn(sender: UIButton) {
        pageNo += 1
        
        // 数字のチェック
        if pageNo == 3 {
            pageNo = 0
        }
        
        scrView.contentOffset = CGPoint(x: 240 * pageNo, y: 0)
        
    }
    
    var timer: NSTimer!
    
    @IBAction func startStop(sender: AnyObject) {
        if timer != nil{
            
            timer.invalidate()
            timer = nil
            
        }else {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "changePic", userInfo: nil, repeats: true)
            self.pageNo = -1;
            
            backbtn.hidden = true
            nextbtn.hidden = true
            
            
        }

    }
    
    
    
    func changePic() {
        
        pageNo += 1
        
        if pageNo == 3 {
            pageNo = 0
            
            
        }
        
        scrView.contentOffset = CGPoint(x: 240 * pageNo, y: 0)
        
    }
    
    @IBAction func backbtn(sender: UIButton) {
        
        
        pageNo -= 1
        
        // 数字のチェック
        if pageNo == -1 {
            pageNo = 2
        }
        
        scrView.contentOffset = CGPoint(x: 240 * pageNo, y: 0)
        
        
        
    }
    
}