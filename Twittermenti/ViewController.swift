//
//  ViewController.swift
//


import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    var swifter: Swifter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let secrets = try? PropertyListDecoder().decode(Secrets.self, from: xml)
        {
            swifter = Swifter(consumerKey: secrets.APIKey, consumerSecret: secrets.APISecret)
        }
        // we get just 15 tweets back, default count is 15 maximum is 100 (more tweets we have to perform this search more than onde increasing the date range or use premium plans
        // lang - just tweets on specific language
        // extended mode - to see full text
        swifter?.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { results, metadata in
            print(results)
        }, failure: { error in
            print("There was an error with Twitter API request, \(error)")
        })

    }

    @IBAction func predictPressed(_ sender: Any) {

    
    }
    
}

