//
//  Question.swift
//  Quizzler
//
//  Created by shayan momeni on 23/05/2019.
//

import Foundation

class Question {
    
    let answer : Bool
    let questionText : String
    
    init(text:String , correctAnswer:Bool){
        
        questionText = text
        answer = correctAnswer
    }
}
