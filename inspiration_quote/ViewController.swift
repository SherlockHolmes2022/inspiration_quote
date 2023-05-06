//
//  ViewController.swift
//  inspiration_quote
//
//  Created by user239088 on 4/30/23.
//
import UIKit

class ViewController: UIViewController  {
    @IBOutlet weak var first_quote: UIImageView!
    var currentImageURL : URL!
    let url = URL(string : "https://picsum.photos/200/300")

    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage(from: url!)
    }
    

    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }
            self.currentImageURL = response?.url
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
        loadImage(from: url!)
    }
    
    
    @IBAction func shareImage(_ sender: UIButton) {
        let activityViewController = UIActivityViewController(activityItems: [currentImageURL.absoluteString], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.print]

        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = sender // `sender` is the button or view that triggered the share action
            popoverController.sourceRect = sender.bounds
        }

        present(activityViewController, animated: true, completion: nil)
    }
}

