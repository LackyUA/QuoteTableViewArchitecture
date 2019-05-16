//
//  QuoteVC.swift
//  TableViewArchitecture
//
//  Created by Dima Dobrovolskyy on 5/16/19.
//  Copyright © 2019 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

class QuoteVC: UIViewController {
    
    // MARK: - Properties
    private var dataSource: QuoteDataSource = QuoteDataSource()
    private var delegate: QuoteDelegate = QuoteDelegate()
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQoutesFromFile()
        configure()
    }
    
    // MARK: - Table view customization
    private func configure() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
}

// MARK: - Fetching methods
private extension QuoteVC {
    
    func fetchQoutesFromFile() {
        guard let url = Bundle.main.url(forResource: "Quotes", withExtension: "json") else { return }
        let request = NetworkRequest(url: url)
        
        request.execute { [weak self] result in
            self?.decode(result)
        }
    }
    
    func decode(_ result: Result<Data, Error>) {
        switch result {
            
        case .success(let data):
            let decoder = JSONDecoder()
            
            do {
                dataSource.quotes = try decoder.decode([Quote].self, from: data)
                tableView.reloadData()
            } catch (let error) {
                print("Parsing data failed: \(error)")
            }
            
        case .failure(let error):
            print("Failed to fetch data from url: \(error)")
            
        }
    }
    
}
