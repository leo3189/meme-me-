//
//  MemeDetailVC.swift
//  Meme Me
//
//  Created by leo on 2/17/19.
//  Copyright © 2019 leonard. All rights reserved.
//

import UIKit

class MemeDetailVC: UIViewController {
    
    @IBOutlet weak var memedImage: UIImageView!
    
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memedImage!.image = meme.memeImage
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
