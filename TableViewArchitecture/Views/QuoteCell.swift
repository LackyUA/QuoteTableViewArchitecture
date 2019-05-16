//
//  QuoteCell.swift
//  TableViewArchitecture
//
//  Created by Dima Dobrovolskyy on 5/16/19.
//  Copyright © 2019 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var quoteLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    // MARK: - life cycle
    override func prepareForReuse() {
        photoImageView.image = #imageLiteral(resourceName: "imagePlaceHolder")
        activityIndicator.startAnimating()
    }
    
    // MARK: - Configuration
    func configure(quote: Quote) {
        quoteLabel.text = quote.quote
        authorLabel.text = quote.author
        configurePhotoImageView(quote.imageUrl)
    }
    
    private func configurePhotoImageView(_ url: URL) {
        photoImageView.layer.borderColor = #colorLiteral(red: 0.285917908, green: 0.2282844186, blue: 0.2859126925, alpha: 1)
        photoImageView.layer.borderWidth = 0.3
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
        
        fetchImage(url)
    }
    
}

// MARK: - Fetching images method
private extension QuoteCell {
    
    func fetchImage(_ url: URL) {
        photoImageView.image = #imageLiteral(resourceName: "imagePlaceHolder")
        
        let request = NetworkRequest(url: url)
        
        request.execute { [weak self] result in
            switch result {
                
            case .success(let data):
                self?.photoImageView.image = UIImage(data: data)
                self?.activityIndicator.stopAnimating()
                
            case .failure(let error):
                print("Failed image fetching: \(error)")
                
            }
        }
    }
    
}
