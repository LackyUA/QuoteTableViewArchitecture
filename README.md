# QuoteTableViewArchitecture
Separated table view logic on 3 parts:
 1. View and data fetching form json in ViewController
 2. Table view data sourcing in DataSource file which inheritance UITableViewDataSource protocol.
 3. Table view delegation in Delegate file which inheritance UITableViewDelegate protocol.
