//
//  CourseListViewModel.swift
//  MVVMtestApp
//
//  Created by Андрей Абакумов on 09.02.2023.
//

import Foundation

protocol CourseListViewModelProtocol {
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func getCourseCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol
    func getCourseDetailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol
}

class CourseListViewModel: CourseListViewModelProtocol {
    private var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.courses = courses
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    func getCourseCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol {
        CourseCellViewModel(course: courses[indexPath.row])
    }
    
    func getCourseDetailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol {
        CourseDetailsViewModel(course: courses[indexPath.row])
    }
}
