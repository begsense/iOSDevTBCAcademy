//
//  Main.swift
//  ClassWork16_BegiK
//
//  Created by M1 on 12.04.2024.
//

import UIKit

class MainVC: UIViewController {
    
    let studentsTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        addStudentsTableView()
    }
    
    func addTitle() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "iOS Squad"
    }

    func addStudentsTableView() {
        view.addSubview(studentsTableView)
        studentsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        studentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        studentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        studentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
        studentsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "students")
        studentsTableView.dataSource = self
        studentsTableView.delegate = self
    }

}

//MARK: ExtensionOfTableView
extension MainVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "students", for: indexPath)
        cell.textLabel?.text = students[indexPath.row].fullName
        let symbolImage = StudentTableViewCell()
        symbolImage.addSymbolImage()
        symbolImage.symbolImageView.image = UIImage(named: "symbolImage")
        cell.addSubview(symbolImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIStackView = {
            let headerView = UIStackView()
            headerView.translatesAutoresizingMaskIntoConstraints = false
            return headerView
        }()
        
        let image = UIImageView(image: UIImage(named: "maleavatar"))
        
        let header: UILabel = {
            let header = UILabel()
            header.translatesAutoresizingMaskIntoConstraints = false
            header.text = "Begi Kopaliani"
            header.textColor = .black
            header.font = UIFont(name: "Arial", size: 22)
            return header
        }()
        
        headerView.addArrangedSubview(image)
        headerView.addArrangedSubview(header)
        headerView.spacing = 7.5
        return headerView
    }
    
    
}

#Preview {
    MainVC()
}
