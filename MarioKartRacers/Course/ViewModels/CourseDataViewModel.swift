//
//  CourseDataViewModel.swift
//  MarioKartRacers
//
//  Created by Giuseppe Sardo on 23/9/2022.
//

import Foundation

class CourseDataViewModel {

    private(set) var courses: [CourseViewModel] = []

    func populateCourseData(url: URL) async {

        do {
            let courses = try await Webservice().getCourseData(url: url)
            self.courses = courses.map(CourseViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct CourseViewModel {
    private let course: Course

    init(course: Course) {
        self.course = course
    }

    var name: String {
        course.name
    }

    var debutTour: String {
        course.debutTour
    }

    var debutGame: String {
        course.debutGame
    }

    var debutSystem: String {
        course.debutSystem
    }

}
