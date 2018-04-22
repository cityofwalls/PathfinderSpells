//
//  Spell.swift
//  PathfinderSpells
//
//  Created by Jesse Battalino on 12/12/17.
//  Copyright © 2017 Jesse Battalino. All rights reserved.
//

import Foundation

class Spell: Comparable {
    var castingTime: String
    var components: String
    var duration: String
    var name: String
    var range: String
    var savingThrow: String
    var school: String
    var source: String
    var description: String
    var level: String
    var targets: String
    
    init(castingTime: String, components: String, duration: String,
         name: String, range: String, savingThrow: String, school: String,
         source: String, description: String, level: String, targets: String) {
        self.castingTime = castingTime
        self.components = components
        self.duration = duration
        self.name = name
        self.range = range
        self.savingThrow = savingThrow
        self.school = school
        self.source = source
        self.description = description
        self.level = level
        self.targets = targets
    }
    
    static func <(lhs: Spell, rhs: Spell) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func ==(lhs: Spell, rhs: Spell) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}
