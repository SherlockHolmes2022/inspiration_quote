//
//  ViewController.swift
//  inspiration_quote
//
//  Created by user239088 on 4/30/23.
//

import UIKit

class ViewController: UIViewController  {
    @IBOutlet weak var first_quote: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }
            guard let imageData = data else {
                print("No image data found")
                return
            }
            let image = UIImage(data: imageData)
            // Display the image in a UIImageView
            DispatchQueue.main.async {
                self.first_quote.image = image
            }
        }
        task.resume()
    }

    
    
    @IBAction func chnage_image(_ sender: UIButton) {
        let url = URL(string : "https://picsum.photos/200/300")
        loadImage(from: url!)
       

    }
    
}

