//
//  PhotoSelectViewController.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/2/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

protocol PhotoSelectViewControllerDelegate: class {
    func photoSelected(_ photo: UIImage)
}

class PhotoSelectViewController: UIViewController {

    @IBOutlet weak var pickerImageView: UIImageView!
    @IBOutlet weak var photoSelectButton: UIButton!
    
    weak var delegate: PhotoSelectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        photoSelectButton.setTitle("Select a photo", for: .normal)
        pickerImageView.image = nil
    }
    
    @IBAction func pickerSelectImageButtonTapped(_ sender: Any) {
        print("selectImageButtonTapped")
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Select a photo", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
}

extension PhotoSelectViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage {
            photoSelectButton.setTitle("", for: .normal)
            pickerImageView.image = photo
            delegate?.photoSelected(photo)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
