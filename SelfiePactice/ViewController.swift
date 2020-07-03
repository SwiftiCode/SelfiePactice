//
//  ViewController.swift
//  SelfiePactice
//
//  Created by Thomas.Tay.sg on 25/2/16.
//  Copyright © 2016 Thomas.Tay.sg. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var myImgaeView: UIImageView!
    
    // MARK: Default Template
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        myImgaeView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: IBAction
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        
        let myPhotoPicker = UIImagePickerController()
        myPhotoPicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            myPhotoPicker.sourceType = .camera
            
            if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                
                myPhotoPicker.cameraDevice = .rear
            
            } else {
                
                myPhotoPicker.cameraDevice = .front
            }
            
        } else {
            
            myPhotoPicker.sourceType = .photoLibrary
        }
        
        present(myPhotoPicker, animated: true, completion: nil)
        
    }

    @IBAction func shareSocial(_ sender: UIBarButtonItem) {
        
      
        
        
    }
}

