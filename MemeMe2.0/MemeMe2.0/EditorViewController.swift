//
//  EditorViewController.swift
//  MemeMe2.0
//
//  Created by Samuel Zepeda on 7/10/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit
import Foundation
class EditorViewController: UIViewController,  UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextFieldDelegate {

    
    
    @IBOutlet weak var topTextField: UITextField!
    
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var library: UIButton!
    
    @IBOutlet weak var camera: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var textFieldView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    var memedImage: UIImage!
    
    @IBOutlet var mainView: UIView!
    
    let imagePicker = UIImagePickerController()
    
    
     let textDetailDelegate = TextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker.delegate = self
        imageView.image = image
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(segueWay))
      
    
        
        self.tabBarController?.tabBar.isHidden = true
        
        
        self.topTextField.delegate = textDetailDelegate
        self.bottomTextField.delegate = textDetailDelegate
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        subscribetoKeyBoardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated )
        unsubscribeFromKeyboardNotification()
    }
    
    
    
    override var prefersStatusBarHidden: Bool{
        get {return true}
    }
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [ String : Any]){
        
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
        
        print("Hello")
        
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func Camera(_ sender: Any) {
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            print ("Camera not availbale")
        }
        
        
    }
    
    
    @IBAction func Library(_ sender: Any) {
        
        
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        // performSegue(withIdentifier:"PhotoEditScreen", sender: self)
        
    }
    
    
    
    
    // prepare for segueway
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        
        
        let editToFinal = segue.destination as? FinalViewController
        editToFinal?.finalImage = memedImage
        
        
    }
    
    
    
    
    
    

    // gereate meme
    @objc func segueWay(){
    
        library.isHidden = true
        camera.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        memedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
    // append and add to tableView 

        let meme = Meme(image: imageView.image!, topText: topTextField.text!, bottomText: bottomTextField.text!)
        
        // Add it to the memes array in the Application Delegate
        (UIApplication.shared.delegate as! AppDelegate).Memes.append(meme)
        
        
        
        library.isHidden = false
        camera.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
        
        performSegue(withIdentifier: "FinishedImage", sender: self)
    }
    
    
    // KeyBoard Movements and text Field adjustment
    
    @objc func keyboardWillShow(_ notifications: Notification){
        
        
        
        // top text field
        if(getKeyboardHeight(notifications) < topTextField.frame.origin.y + 52) && (topTextField.isEditing){
            
            
            mainView.frame.origin.y = textFieldView.frame.origin.y - ( topTextField.frame.origin.y - getKeyboardHeight(notifications)) - 90
        }
        
        
        
        // bottom textfield
        if ( getKeyboardHeight(notifications) < bottomTextField.frame.origin.y + 52  && bottomTextField.isEditing ){
            
            mainView.frame.origin.y = textFieldView.frame.origin.y - ( bottomTextField.frame.origin.y - getKeyboardHeight(notifications)) - 90
        }
        
        
    }
    
    
    // Reset to original View
    @objc func keyboardWillGo(_ notificatons: Notification){
        
        mainView.frame.origin.y = 0.0
        
    }
    
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat{
        
        // Keyboard Y orgin is 465.0 in height
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        print(" Here is keyboard origin \(keyboardSize.cgRectValue.origin.y)")
        
        
        return keyboardSize.cgRectValue.origin.y
        
    }
    
    func subscribetoKeyBoardNotifications(){
        
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillShow(_ :)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillGo(_:)), name: .UIKeyboardDidHide, object: nil)
        
    }
    
    
    func unsubscribeFromKeyboardNotification(){
        
        NotificationCenter.default.removeObserver(self, name: . UIKeyboardWillShow, object: nil)
        
    }
   
}
