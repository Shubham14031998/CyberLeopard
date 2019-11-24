//
//  ImagePicker.swift
//  CyberLeopard
//
//  Created by Shubham Kaliyar on 24/11/19.
//


// MARK:- Permission in Info Plist
/*
 1- For Camera
 
 Key       :  Privacy - Camera Usage Description
 Value     :  $(PRODUCT_NAME) camera use
 
 2- For Gallery
 Key       :  Privacy - Photo Library Usage Description
 Value     :  $(PRODUCT_NAME) photo use
 
 */

public var pickerCallBack:PickerImage = nil
public typealias PickerImage = ((UIImage?) -> (Void))?
public let ImagePickerHalper = ImagePicker.sharedInstanse

import UIKit

public class ImagePicker: NSObject {
    
    private override init() {
    }
    
    static var sharedInstanse : ImagePicker = ImagePicker()
    var picker = UIImagePickerController()
    
    // MARK:- Action Sheet
    func showActionSheet(withTitle title: String?, withAlertMessage message: String?, withOptions options: [String], handler:@escaping (_ selectedIndex: Int) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for strAction in options {
            let anyAction =  UIAlertAction(title: strAction, style: .default){ (action) -> Void in
                return handler(options.firstIndex(of: strAction)!)
            }
            alert.addAction(anyAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ (action) -> Void in
            return handler(-1)
        }
        alert.addAction(cancelAction)
        presetImagePicker(pickerVC: alert)
        
    }
    
    // MARK: Public Method
    
    /**
     
     * Public Method for showing ImagePicker Controlller simply get Image
     * Get Image Object
     */
    
    public  func showPickerController(_ handler:PickerImage) {
        self.showActionSheet(withTitle: "Choose Option", withAlertMessage: nil, withOptions: ["Take Picture", "Open Gallery"]){ ( _ selectedIndex: Int) in
            switch selectedIndex {
            case 0:
                self.showCamera()
            case 1:
                self.openGallery()
            default:
                break
            }
        }
        
        pickerCallBack = handler
    }
    
    
    // MARK:-  Camera
    func showCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = true
            picker.delegate = self
            picker.sourceType = .camera
            presetImagePicker(pickerVC: picker)
        } else {
            print("Camera not available.")
        }
        picker.delegate = self
    }
    
    
    // MARK:-  Gallery
    
    func openGallery() {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        presetImagePicker(pickerVC: picker)
        picker.delegate = self
    }
    
    // MARK:- Show ViewController
    
    private func presetImagePicker(pickerVC: UIViewController) -> Void {
        UIApplication.shared.windows.first?.rootViewController?.present(pickerVC, animated: true, completion: {
            self.picker.delegate = self
        })
    }
    
    fileprivate func dismissViewController() -> Void {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK;- func for imageView in swift
    public func saveImage (imageView :UIImage) {
        UIImageWriteToSavedPhotosAlbum(imageView, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if error != nil {
            print("Photos not Saved ")
        } else {
            print("Your altered image has been saved to your photos. ")
        }
    }
}


// MARK: - Picker Delegate
extension ImagePicker : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String  : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        pickerCallBack?(image)
        dismissViewController()
    }
    
    private func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissViewController()
    }
}

