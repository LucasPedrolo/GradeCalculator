//
//  ViewController.swift
//  GradeCalculator
//
//  Created by unicred on 13/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView = HomeView()
    var grade: Register?
    let userDefault = UserDefaults.standard
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        homeView.registerButton.addTarget(self, action: #selector(navigationRegister), for: .touchUpInside)
        homeView.seeGradeButton.addTarget(self, action: #selector(navigationGrade), for: .touchUpInside)
    }
    
    func getData(data: Register) {
        
        self.grade = data
    }
    
    @objc func navigationRegister() {
        let goRegister = RegisterViewController()
        
        navigationController?.pushViewController(goRegister, animated: true)
    }
    
    @objc func navigationGrade() {
        let goGrade = GradeCollectionViewController()
        
        if let grade = self.grade {
            goGrade.getData(data: grade)
        }
        
        navigationController?.pushViewController(goGrade, animated: true)
    }
}
