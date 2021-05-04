//
//  CourseDescriptionModel.swift
//  namaste
//
//  Created by akira tsukamoto on 30/04/21.
//

class CourseDescriptionModel {
    
    let classes: [Int]
    let linkURL: String
    
    internal init(classes: [Int], linkURL: String) {
        self.classes = classes
        self.linkURL = linkURL
    }
}
