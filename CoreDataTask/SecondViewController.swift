//
//  SecondViewController.swift
//  CoreDataTask
//
//  Created by Marni Anuradha on 12/21/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit
import CoreData
class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var imageButton: UIButton!
    //    // @IBOutlet weak var countryTF: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    var imageInData:Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageButton.layer.cornerRadius = 85
        
        imageButton.clipsToBounds = true
        
        nameTF.keyboardType = .asciiCapable
        ageTF.keyboardType = .numberPad
        emailTF.keyboardType = .emailAddress
        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func galleryButton(_ sender: UIButton) {
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)){
            
            imagePicker.delegate = self
            
            imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            print("Picked Image")
            
            
            
            imageButton.setBackgroundImage(pickedImage, for: UIControl.State.normal)
            
            imageInData = pickedImage.pngData()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func onSaveBtnTap(_ sender: UIButton) {
        
        CRUD.insertValue(entitiyName: "PersonalDetails", key1: "name", value1: nameTF.text!, key2: "email", value2: emailTF.text!, key3: "age", value3: Int16(ageTF.text!)!, key4: "picture", value4: imageInData)
    }
    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
