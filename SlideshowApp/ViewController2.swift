//
//  ViewController2.swift
//  SlideshowApp
//
//  Created by 斉藤 on 2016/03/25.
//  Copyright © 2016年 taku.saito. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var imageName:String? = ""
    
    @IBAction func back(sender: AnyObject) {
    }

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
       image.image = UIImage(named: imageName!)

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
