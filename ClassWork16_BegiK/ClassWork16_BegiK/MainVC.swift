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
    
    var sortedStudents = [(String, [StudentData])]()
    var sectionTitles = [String]()
    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        addStudentsTableView()
        sortAndGroupStudents()
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
    
    func sortAndGroupStudents() {
        let sortedStudentsDict = Dictionary(grouping: students) { String($0.fullName.prefix(1)).uppercased() }
        sortedStudents = sortedStudentsDict.sorted { $0.key < $1.key }
        for key in sortedStudentsDict.keys.sorted() {
            sectionTitles.append(key)
        }
    }

}

//MARK: ExtensionOfTableView
extension MainVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedStudents[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "students", for: indexPath)
        cell.textLabel?.text = sortedStudents[indexPath.section].1[indexPath.row].fullName
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles
    }
    
}

#Preview {
    MainVC()
}
