//
//  GradeDetailsController.swift
//  GradeCalculator
//
//  Created by unicred on 16/01/23.
//

import UIKit

class GradeDetailsViewController: UIViewController {
 
    var grade: [Grade]?
    var gradeDetailsView = GradeDetailsView()
    
    override func loadView() {
        view = gradeDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getData(data: Grade) {
        gradeDetailsView.grade = data
    }
}
