//
//  FinalViewController.swift
//  MemeMe2.0
//
//  Created by Samuel Zepeda on 7/11/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    
    @IBOutlet weak var FinalImage: UIImageView!
    
    var finalImage: UIImage!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        FinalImage.image = finalImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(ShareAndSave))
        
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func ShareAndSave(){
        
       //  1. Generate the Meme
       //  2. Share activity View Controll
       //  3. present share activity view controller
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
