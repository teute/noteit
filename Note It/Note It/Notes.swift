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

enum NoteError: Error {
    case emptyString
    case duplicateItem
    case outOfRange(index: Int)
}

class Notes {
    var notes:[Note]
    
    public static let sharedInstance = Notes()
    
    private init() {
        self.notes = []
    }
    
    public func add(note: Note) throws {
        // TODO: needs implementing
        // Check that note title and text are not empty
        if (note.text.isEmpty) {
            throw NoteError.emptyString
        }
        
        self.notes.append(note)
    }
    
    public func getNote(atIndex index: Int) throws -> Note {
        if (index < 0) || (index > (self.notes.count - 1)) {
            throw NoteError.outOfRange(index: index)
        }
        return self.notes[index]
    }
    
    public var count: Int {
        get {
            return self.notes.count
        }
    }
    
    public func clearList() {
        self.notes.removeAll()
    }
    
    public func insert(note: Note, at index: Int) throws {
        if (index < 0) || (index > (self.notes.count - 1)) {
            throw NoteError.outOfRange(index: index)
        }
        self.notes.insert(note, at: index)
    }
    
    public func update(note: Note, at index: Int) throws {
        // Check that the index is within bounds
        if (index < 0) || (index > (self.notes.count - 1)) {
            throw NoteError.outOfRange(index: index)
        }
        self.notes[index] = note
    }
    
    public func remove(at index: Int) throws {
        if (index < 0) || (index > (self.notes.count - 1)) {
            throw NoteError.outOfRange(index: index)
        }
        self.notes.remove(at: index)
    }
}
