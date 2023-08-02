//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Bahittin on 1.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedImage: String?
    var imageTitle: String?
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: selectedImage!)
        navigationController?.navigationBar.prefersLargeTitles  = false
        title = imageTitle
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    @objc func shareTapped() {
        guard let image = image.image?.jpegData(compressionQuality: 0.8) else { return print("no image found")  }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
