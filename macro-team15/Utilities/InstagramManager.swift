//
//  InstagramManager.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 06/12/22.
//

//import Foundation
import UIKit

class InstagramManager {
    
    static func shareToInstagramStories(
        uiImage: UIImage,
        backgroundTopColor: String = "#D1F8B8",
        backgroundBottomColor: String = "#5DA03F"
    ) {
        // 1. Get a data object of our UIImage...
        let stickerImageData = uiImage.pngData()
        
        // 2. Verify if we are able to open instagram-stories URL schema.
        // If we are able to, let's add our Sticker image to UIPasteboard.
        
        let urlScheme = URL(string: "instagram-stories://share?source_application=\(Bundle.main.bundleIdentifier ?? "")")
        
        if let urlScheme = urlScheme {
            if UIApplication.shared.canOpenURL(urlScheme) {
                
                var pasteboardItems: [[String : Any]]? = nil
                if let stickerImageData = stickerImageData {
                    pasteboardItems = [
                        [
                            "com.instagram.sharedSticker.stickerImage": stickerImageData,
                            "com.instagram.sharedSticker.backgroundTopColor": backgroundTopColor,
                            "com.instagram.sharedSticker.backgroundBottomColor": backgroundBottomColor,
                        ]
                    ]
                }
                
                // We'll expire these pasteboard items in 5 minutes...
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)
                ]
                
                if let pasteboardItems = pasteboardItems {
                    UIPasteboard.general.setItems(pasteboardItems, options: pasteboardOptions)
                }
                
                // 3. Try opening the URL...
                UIApplication.shared.open(urlScheme, options: [:], completionHandler: nil)
            } else {
                // App may not be installed. Handle those errors here...
                print("Something went wrong. Maybe Instagram is not installed on this device?")
            }
        }
    }
    
}
