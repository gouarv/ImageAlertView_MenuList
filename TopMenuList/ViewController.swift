//
//  ViewController.swift
//  TopMenuList
//
//  Created by Mac on 21/03/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var filterType = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigation()
    }
    
    //MARK: UIMenu List
    public func setupNavigation(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Details"
        self.navigationController?.navigationBar.topItem?.title = "Task"

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)

        let barButtonMenu = UIMenu(title: "Filter List", children: [
            
            UIAction(title: NSLocalizedString("Edit", comment: ""), image: UIImage(systemName: "applepencil"), handler: {
                (_) in
               //Handle Actions
            }),
            UIAction(title: NSLocalizedString("Delete"  ,comment: ""), image: UIImage(systemName: "bin.xmark.fill"), handler: {
                (_) in
                //Handle Actions
            }),
            UIAction(title: NSLocalizedString("Approve", comment: ""), image: UIImage(systemName: "person.fill.checkmark"), handler: {
                (_) in
                //Handle Actions
            }),
        ])
        
        self.navigationItem.rightBarButtonItem?.menu = barButtonMenu
    }

    
    
    @IBAction func openAction(_ sender: UIButton) {
        if sender.tag == 1{
            self.openCheckBoxActionSheet()

        } else if sender.tag == 2{
            self.openImagesActionSheet()
        } else {
            self.openImageAlertView()
        }

    }
    //MARK: Action Sheet with check box
     func openCheckBoxActionSheet(){// change code
        
        let firstButton = UIAlertAction(title: "Preview", style: .default, handler: { [unowned self] _ in
            self.filterType = "live"
        })

        let secondButton = UIAlertAction(title: "Active", style: .default, handler: { [unowned self] _ in
            self.filterType = "active"
        })

        let thirdButton = UIAlertAction(title: "Draft", style: .default, handler: { [unowned self] _ in
            self.filterType = "draft"
        })

        let forthButton = UIAlertAction(title: "Complete", style: .default, handler: { [unowned self] _ in
            self.filterType = "complete"
        })

        let fifthButton = UIAlertAction(title: "Inactive", style: .default, handler: { [unowned self] _ in
            self.filterType = "inactive"
        })

        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)

        switch self.filterType {
        case "live":
            firstButton.setValue(true, forKey: "checked")
        case "active":
            secondButton.setValue(true, forKey: "checked")
        case "draft":
            thirdButton.setValue(true, forKey: "checked")
        case "complete":
            forthButton.setValue(true, forKey: "checked")
        default:
            fifthButton.setValue(true, forKey: "checked")
        }

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(firstButton)
        alert.addAction(secondButton)
        alert.addAction(thirdButton)
        alert.addAction(forthButton)
        alert.addAction(fifthButton)
        alert.addAction(cancel)

        self.present(alert, animated: true, completion: nil)
        
    }

    //MARK: Action Sheet With Images
    func openImagesActionSheet(){// change code
        
        let firstButton = UIAlertAction(title: "Approve", style: .default, handler: nil)
        firstButton.setValue(true, forKey: "person.fill.checkmark")

        let secondButton = UIAlertAction(title: "Remove", style: .default, handler: nil)
        firstButton.setValue(true, forKey: "bin.xmark.fill")

        let thirdButton = UIAlertAction(title: "Share", style: .default, handler: nil)
        firstButton.setValue(true, forKey: "person.line.dotted.person.fill")

        let forthButton = UIAlertAction(title: "Download", style: .default, handler: nil)
        firstButton.setValue(true, forKey: "square.and.arrow.down.fill")

        let cancel = UIAlertAction(title: "View", style: .cancel, handler:nil)
        cancel.setValue(true, forKey: "doc.text.magnifyingglass")

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(firstButton)
        alert.addAction(secondButton)
        alert.addAction(thirdButton)
        alert.addAction(forthButton)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openImageAlertView(){
        let showAlert = UIAlertController(title: "Image", message: nil, preferredStyle: .alert)
        showAlert.addImage(image: UIImage(named: "img_146724")!)

        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        showAlert.view.tintColor = .blue

        self.present(showAlert, animated: true, completion: nil)
    }
    
    func openTopImageAlertView(){
        let showAlert = UIAlertController(title: "\nALERT", message: "sadasfsffdssdfdsfsdfsfsdfsdfsdfsdfsfsdfsdfsdfsfsdfsdfsffsfsdfsdfsdfsfdssdsfdsfdfdfsdfsdfdsfdsffsdfdfdfdsfdfsdfsfsfsfsfsfsfsfsfsfsfsfsfsffsffdsfs", preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: showAlert.view.center.x - 25, y: -25, width: 50, height: 50))
       // imageView.image = UIImage(systemName: "paperplane.circle.fill")
        imageView.backgroundColor = .black
        
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        showAlert.view.addSubview(imageView)

        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
    }
    
}

extension UIAlertController {
    func addImage (image: UIImage) {
        
        let maxSize = CGSize (width: 245, height: 300)
        let imgSize = image.size
        
        
        var ratio: CGFloat!
        if (imgSize.width > imgSize.height) {
            ratio = maxSize.width / imgSize.width
        } else {
            ratio = maxSize.height / imgSize.height
        }
        let scaledSize = CGSize (width: imgSize.width * ratio, height: imgSize.height * ratio)
        var resizedImage = image.imagewithSize(scaledSize)
        
        if (imgSize.height > imgSize.width) {
            let left = (maxSize.width - resizedImage.size.width) / 2
            resizedImage = resizedImage.withAlignmentRectInsets(UIEdgeInsets(top: 0,left: -left,bottom: 0,right: 0))
        }
            
        let imgAction = UIAlertAction (title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(resizedImage.withRenderingMode(.alwaysOriginal),forKey:"image")
        self.addAction (imgAction)
    }
}

extension UIImage {
    func imagewithSize(_ size:CGSize) -> UIImage {
        var scaledImageRect = CGRect.zero
        let aspectWidth:CGFloat = size.width / self.size.width
        let aspectHeight:CGFloat = size.height / self.size.height
        let aspectRatio:CGFloat = min(aspectWidth, aspectHeight)
        scaledImageRect.size.width = self.size.width * aspectRatio
        scaledImageRect.size.height = self.size.height * aspectRatio
        scaledImageRect.origin.x = (size.width - scaledImageRect.size.width) / 2.0
        scaledImageRect.origin.y = (size.height - scaledImageRect.size.height) / 2.0
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext ()
        UIGraphicsEndImageContext ()
        return scaledImage!
    }
}
