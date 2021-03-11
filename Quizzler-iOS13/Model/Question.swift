//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Keoki on 9/3/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let text:String
    let answer:String
    
    
    init(q:String, a:String) {
        text = q
        answer = a
    }
}
