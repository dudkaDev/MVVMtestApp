//
//  CourseDetailsViewModel.swift
//  MVVMtestApp
//
//  Created by Андрей Абакумов on 08.02.2023.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    init(course: Course)
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
