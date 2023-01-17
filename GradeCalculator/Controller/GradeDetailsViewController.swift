//
//  GradeDetailsController.swift
//  GradeCalculator
//
//  Created by unicred on 16/01/23.
//

import UIKit

class GradeDetailsViewController: UIViewController {
    
    var grade: [Register]?
    var gradeDetailsView = GradeDetailsView()
    var viewModel = GradeDetailsViewModel()
    
    override func loadView() {
        view = gradeDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeData()
    }
    
    func getData(data: Register) {
        gradeDetailsView.grade = data
    }
    
    func gradeData() {
        let result = viewModel.calcGradeData(grade1: Int(gradeDetailsView.grade1TxtField.text ?? defString) ?? 0, grade2: Int(gradeDetailsView.grade2TxtField.text ?? defString) ?? 0, grade3: Int(gradeDetailsView.grade3TxtField.text ?? defString) ?? 0, grade4: Int(gradeDetailsView.grade4TxtField.text ?? defString) ?? 0)
        
        gradeDetailsView.calcGradeLabel.text = "Média: \(result)"
    }
}
