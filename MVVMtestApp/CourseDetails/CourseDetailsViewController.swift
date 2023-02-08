//
//  CourseDetailsViewController.swift
//  MVVMtestApp
//
//  Created by Андрей Абакумов on 08.02.2023.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessonsLabel: UILabel!
    @IBOutlet var numberOfTestsLabel: UILabel!
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    
    var course: Course!
    
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavoriteStatus()
        setupUI()
    }
    
    @IBAction func toggleFavorite() {
        isFavorite.toggle()
        setStatusForFavoriteButton()
        DataManager.shared.setFavoriteStatus(for: course.name, with: isFavorite)
    }
    
    private func setupUI() {
        courseNameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTestsLabel.text = "Number of tests: \(course.numberOfTests)"
        
        if let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl) {
            courseImage.image = UIImage(data: imageData)
        }
        
        setStatusForFavoriteButton()
    }
    
    private func setStatusForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
    
    private func loadFavoriteStatus() {
        isFavorite = DataManager.shared.getFavoriteStatus(for: course.name)
    }
}
