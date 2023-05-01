//
//  ViewController.swift
//  inspiration_quote
//
//  Created by user239088 on 4/30/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var first_quote: UIImageView!
    var count = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first_quote.image = UIImage(imageLiteralResourceName: "index")
        
    }

    @IBAction func chnage_image(_ sender: UIButton) {
        first_quote.image = UIImage(imageLiteralResourceName: "100-of-the-Most-Uplifting-Quotes-Ever5-scaled")
        print("Count is " , count + 5)
    }
    
}

