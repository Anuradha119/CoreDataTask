//
//  ViewController.swift
//  CoreDataTask
//
//  Created by Marni Anuradha on 12/21/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var imageStackView: UIStackView!
    
    @IBOutlet weak var detailsBtnStackView: UIStackView!
    
    @IBOutlet weak var deleteBtnStackView: UIStackView!
    
    var allImageView = [UIImageView]()
    var allDetailsButton = [UIButton]()
    var allDeleteButton = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true))
        CRUD.deleteAll(entityName: "PersonalDetails")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let data = CRUD.fetchData(entityName: "PersonalDetails")
        
        detailsBtnStackView.spacing = 20
        imageStackView.spacing = 20
        deleteBtnStackView.spacing = 20
        
        for(i,x) in data.enumerated(){
            
            let imageView = UIImageView()
            imageView.image = UIImage(data: ( x.value(forKey: "picture") as! Data))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
            imageView.layer.cornerRadius = 15
            imageView.clipsToBounds = true
            imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
            imageStackView.addArrangedSubview(imageView)
            allImageView.append(imageView)
            
            let detailsButton = UIButton()
            detailsButton.layer.cornerRadius = 15
            detailsButton.titleLabel?.numberOfLines = 0
            detailsButton.backgroundColor = .red
            detailsButton.setTitle((x.value(forKey: "name") as! String) + " " + (String(x.value(forKey: "age") as! Int16)) + "\n" + (x.value(forKey: "email") as! String), for: UIControl.State.normal)
            detailsBtnStackView.addArrangedSubview(detailsButton)
            detailsButton.translatesAutoresizingMaskIntoConstraints = false
            detailsButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
            allDetailsButton.append(detailsButton)
            
            let deleteButton = UIButton()
            deleteButton.layer.cornerRadius = 15
            deleteButton.setTitle("Delete", for: UIControl.State.normal)
            deleteButton.backgroundColor = .gray
            deleteBtnStackView.addArrangedSubview(deleteButton)
            deleteButton.translatesAutoresizingMaskIntoConstraints = false
            deleteButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
            deleteButton.tag = i;
            allDeleteButton.append(deleteButton)
            
        }
    }
    @IBAction func addContactBtnTap(_ sender: Any) {
        
        let sVC = storyboard?.instantiateViewController(identifier: "secondVC") as! SecondViewController
        
        navigationController?.pushViewController(sVC, animated: true)
        
        cleanUI()
    }
    
    func cleanUI(){
        
        for(x,y) in zip(allDeleteButton, allImageView)
        {
            x.removeFromSuperview()
            y.removeFromSuperview()
        }
        
        for z in allDetailsButton
        {
            z.removeFromSuperview()
        }
        
        resetObjectCollectors()
    }
    
    func resetObjectCollectors()
    {
        
        allImageView = [UIImageView]()
        allDetailsButton = [UIButton]()
        allDeleteButton = [UIButton]()
    }
    
}

