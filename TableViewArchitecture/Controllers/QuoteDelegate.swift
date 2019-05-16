//
//  QuoteDelegate.swift
//  TableViewArchitecture
//
//  Created by Dima Dobrovolskyy on 5/16/19.
//  Copyright © 2019 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

class QuoteDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Configure header and footer view for sections
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.5))
        
        view.backgroundColor = #colorLiteral(red: 0.285917908, green: 0.2282844186, blue: 0.2859126925, alpha: 1)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.5))
        
        view.backgroundColor = #colorLiteral(red: 0.285917908, green: 0.2282844186, blue: 0.2859126925, alpha: 1)
        
        return view
    }
    
    // MARK: - Configure height for footer and header
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.5
    }
    
}
