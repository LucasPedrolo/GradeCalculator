//
//  RegisterViewCollectionController.swift
//  GradeCalculator
//
//  Created by unicred on 16/01/23.
//

import UIKit

class GradeCollectionViewController: UIViewController {
    
    var grade: [Grade]?
    let gradeView = GradeCollectionView()
    private let cellId = "cellId"
    
    override func loadView() {
        view = gradeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    func setCollectionView() {
        gradeView.collectionView.delegate = self
        gradeView.collectionView.dataSource = self
        gradeView.collectionView.register(GradeCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func getData(data: Grade) {
        grade = [data]
    }
}

extension GradeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let item = grade?.count {
            return item
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? GradeCollectionViewCell
        
        if let item = grade?[indexPath.item] {
            cell?.grade = item
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gradeDetails = GradeDetailsViewController()
        if let grade = self.grade {
            gradeDetails.getData(data: grade[indexPath.item])
        }
        navigationController?.pushViewController(gradeDetails, animated: true)
    }
}
