//
//  ViewController.swift
//  SelfiePactice
//
//  Created by Thomas.Tay.sg on 25/2/16.
//  Copyright © 2016 Thomas.Tay.sg. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookShare

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, SharingDelegate {
   
    

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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        myImgaeView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: ShareDelegate
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
           print("Share ok")
       }
       
       func sharer(_ sharer: Sharing, didFailWithError error: Error) {
           print("Share Error")
       }
       
       func sharerDidCancel(_ sharer: Sharing) {
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
        
        print("start sharing")
        
        // prepare for FB share
        let fbPhoto = SharePhoto()
        fbPhoto.image = myImgaeView.image
        fbPhoto.isUserGenerated = true
        
        // FB Content
        let content = SharePhotoContent()
        content.photos = [fbPhoto]
        
        // FB Dialog
        let dialog = ShareDialog(fromViewController: self, content: content, delegate: self)
        dialog.mode = .native
        if dialog.canShow {
            dialog.show()
        } else {
            print("error show dialog")
        }
        
        
    }
}

