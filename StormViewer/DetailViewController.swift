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
    }
}
