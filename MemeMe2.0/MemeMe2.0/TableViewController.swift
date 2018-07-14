//
//  TableViewController.swift
//  MemeMe2.0
//
//  Created by Samuel Zepeda on 7/13/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    //var Memes: [Meme] = []
    var Memes = (UIApplication.shared.delegate as! AppDelegate).Memes


    @IBOutlet var tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let meme = Memes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell") as! MemeCell
        
        cell.setMeme(meme: meme)
        
        return cell
    }
    
    
}




