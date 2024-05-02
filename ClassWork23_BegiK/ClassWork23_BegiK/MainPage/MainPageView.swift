//
//  MainPageView.swift
//  ClassWork23_BegiK
//
//  Created by M1 on 01.05.2024.
//

import UIKit

class MainPageView: UIViewController {
    
    //MARK: Properties:
    
    var viewModel: MainPageViewModel
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .none
        return tableView
    }()
    
    let mainView: UIView = {
        let stackView = UIView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let leftCat: UIImageView = {
        let leftCat = UIImageView()
        leftCat.translatesAutoresizingMaskIntoConstraints = false
        leftCat.image = UIImage(named: "leftCat")
        leftCat.heightAnchor.constraint(equalToConstant: 60).isActive = true
        leftCat.widthAnchor.constraint(equalToConstant: 40).isActive = true
        leftCat.contentMode = .scaleAspectFill
        return leftCat
    }()
    
    let mainCat: UIImageView = {
        let mainCat = UIImageView()
        mainCat.translatesAutoresizingMaskIntoConstraints = false
        mainCat.contentMode = .scaleAspectFill
        mainCat.image = UIImage(named: "mainCat")
        mainCat.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mainCat.widthAnchor.constraint(equalToConstant: 70).isActive = true
        mainCat.layer.cornerRadius = 40
        return mainCat
    }()
    
    let rightCat: UIImageView = {
        let rightCat = UIImageView()
        rightCat.translatesAutoresizingMaskIntoConstraints = false
        rightCat.image = UIImage(named: "rightCat")
        rightCat.heightAnchor.constraint(equalToConstant: 60).isActive = true
        rightCat.widthAnchor.constraint(equalToConstant: 40).isActive = true
        rightCat.contentMode = .scaleAspectFill
        return rightCat
    }()
    
    //MARK: Lifecycle:
    
    init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reloadData()
        viewModel.didLoad()
    }

    //MARK: SetupUI:
    
    func setupUI() {
        view.backgroundColor = .black
        setupCatsImages()
        setupTableView()
    }
    
    func setupCatsImages() {
        view.addSubview(mainCat)
        NSLayoutConstraint.activate([
            mainCat.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mainCat.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mainCat.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainPageTableViewCell.self, forCellReuseIdentifier: MainPageTableViewCell.identifier)
        
        tableView.separatorStyle = .none
    }
    
    private func reloadData() {
        viewModel.dataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    

}

extension MainPageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfFacts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainPageTableViewCell.identifier) as! MainPageTableViewCell
        let catsFact = viewModel.catsFacts[indexPath.row]
        cell.cellLabel.text = catsFact.fact
        return cell
    }
    
    
}

extension MainPageView: UITableViewDelegate {
    
}

