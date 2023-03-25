//
//  MainViewController.swift
//  RxSwiftTest
//
//  Created by Алексей Щукин on 14.03.2023.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    let tableView = UITableView()
    let viewModel = MainViewModel()
    let refreshControl = UIRefreshControl()

// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConstraints()
        setupQuotesInTableView()
        setupDelegates()
        tableViewsetup()
        viewCustomizing()
        addSubViews()
        addTargets()
    }
}

// MARK: - View Customizing
extension MainViewController{
    func viewCustomizing(){
        view.backgroundColor = .systemBackground
        title = "Quotes"
    }
}

// MARK: - SubViews
extension MainViewController{
    func addSubViews(){
        tableView.addSubview(refreshControl)
        //tableView.refreshControl = rephreshControl
    }
}

// MARK: - Targets
extension MainViewController{
    func addTargets(){
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
    }
}

// MARK: - ojbc funcs
extension MainViewController{
    @objc func refreshTableView(){
        viewModel.makeNewQuotes {
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }
    }
}

// MARK: - TableView setup
extension MainViewController{
    func tableViewsetup(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - Delegates
extension MainViewController{
    func setupDelegates(){
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - RxSetup
extension MainViewController: UITableViewDelegate{
    func setupQuotesInTableView(){
        viewModel.quote.asObservable().subscribe(onNext: { quote in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
}

// MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.quote.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        cell.authorLabel.text = String(viewModel.quote.value[indexPath.row].author)
        cell.contentLabel.text = String(viewModel.quote.value[indexPath.row].content)
        return cell
    }
}

// MARK: - Constraints
extension MainViewController{
    func tableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
}
