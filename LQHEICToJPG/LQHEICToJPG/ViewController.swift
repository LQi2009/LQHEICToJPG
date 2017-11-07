//
//  ViewController.swift
//  LQHEICToJPG
//
//  Created by Artron_LQQ on 2017/11/7.
//  Copyright © 2017年 Artup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    lazy var imageView: UIImageView = {
        
        let img = UIImageView()
        img.frame = CGRect(x: 20, y: 100, width: 200, height: 200)
        self.view.addSubview(img)
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 40, y: 60, width: 100, height: 40)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
    }

    @objc func btnAction() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let url = info["UIImagePickerControllerMediaURL"] as? URL {
            
            if let image = UIImage.imageWithHeic(url) {
                imageView.image = image
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

