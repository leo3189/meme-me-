//
//  MemeTableVC.swift
//  Meme Me
//
//  Created by leonard on 2/15/19.
//  Copyright © 2019 leonard. All rights reserved.
//

import UIKit

class MemeTableVC: UITableViewController {

    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let memesCount = memes.count
        print("Count \(memesCount)")
        if memesCount == 0 {
            let viewController = self.storyboard!.instantiateViewController(withIdentifier:
                "MemeNav") as! UINavigationController
            self.present(viewController, animated: true, completion: nil)
        }
        return memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MemeTVCell

        // Configure the cell...
        let item = memes[indexPath.row]
        cell.memedImage.image = item.memeImage
        cell.memeLbl.text = "\(item.topText as AnyObject)" + "..." + "\(item.bottomText as AnyObject)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier:
            "MemeDetailVC") as! MemeDetailVC
        detailController.meme = memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    

}
