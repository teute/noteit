//
//  Notes.swift
//  Note It
//
//  Created by Salieu Kamara on 27/10/2016.
//  Copyright © 2016 Coventry University. All rights reserved.
//

import Foundation

struct Note {
    var title: String
    var text: String
}

class Notes {
    var notes:[Note]
    
    init() {
        self.notes = []
    }
    
    public func add(note: Note) throws {
        // TODO: needs implementing
    }
    
    public func getNote(atIndex index: Int) throws -> Note {
        // TODO: needs implementing
    }
    
    public var count: Int {
        get {
            return 0
            // TODO: needs implementing
        }
    }
    
    public func clearList() {
        // TODO: needs implementing
    }
    
    public func insert(note: Note, at index: Int) throws {
        // TODO: needs implementing
    }
    
    public func update(note: Note, at index: Int) throws {
        // TODO: needs implementing
    }
    
    public func remove(at index: Int) throws {
        // TODO: needs implementing
    }
}
