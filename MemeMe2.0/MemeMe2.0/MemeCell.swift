//
//  MemeCell.swift
//  MemeMe2.0
//
//  Created by Samuel Zepeda on 7/13/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit

class MemeCell: UITableViewCell {

    
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var topTextTableView: UILabel!
    @IBOutlet weak var bottomTextTableView: UILabel!
    
    
    
    func setMeme(meme: Meme){
//        tableImageView.image = Meme.image
 //       topTextTableView.text = Meme.topText
        Meme.init(image: tableImageView.image!, topText: topTextTableView.text!, bottomText: bottomTextTableView.text!)
        
        }
    

}
