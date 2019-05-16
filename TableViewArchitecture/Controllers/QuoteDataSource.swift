//
//  QuoteDataSource.swift
//  TableViewArchitecture
//
//  Created by Dima Dobrovolskyy on 5/16/19.
//  Copyright © 2019 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

class QuoteDataSource: NSObject {
    
    // MARK: - Properties
    var quotes: [Quote] = []
    
    // MARK: - Constants
    private let reusableIdentifier = "Cell"
    
}

extension QuoteDataSource: UITableViewDataSource {
    
    // MARK: - Configure data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as? QuoteCell else {
            return UITableViewCell()
        }
        
        cell.configure(quote: quotes[indexPath.row])
        
        return cell
    }
    
}
