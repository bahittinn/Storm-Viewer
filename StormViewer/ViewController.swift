//
//  ViewController.swift
//  StormViewer
//
//  Created by Bahittin on 1.08.2023.
//

import UIKit

class ViewController: UITableViewController {

    
    var pictures = [String]()
    var sortedArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Images"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        sortedArray = pictures.sorted()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture")
        cell?.textLabel?.text = sortedArray[indexPath.row]
        cell?.textLabel?.adjustsFontSizeToFitWidth = true
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = sortedArray[indexPath.row]
            vc.imageTitle = "Picture \(indexPath.row + 1) of \(sortedArray.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

