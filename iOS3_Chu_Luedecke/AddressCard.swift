//
//  AddressCard.swift
//  iOS3_Chu_Luedecke
//
//  Created by  on 24.11.21.
//

import Foundation

class AddressCard: Codable, Equatable, Hashable, Identifiable {
    var id = UUID()
    var vorName = String()
    var nachName = String()
    var strasse = String()
    var postLeitZahl = Int()
    var ort = String()
    var hobbys = [Hobby]()
    var freunde = [UUID]()
    
    init(vorName: String, nachName: String, strasse: String, postLeitZahl: Int, ort: String) {
        self.vorName = vorName
        self.nachName = nachName
        self.strasse = strasse
        self.postLeitZahl = postLeitZahl
        self.ort = ort
    }
    
    static func == (erste: AddressCard, zweite: AddressCard) -> Bool {
        return erste.id == zweite.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func add(hobby: Hobby) {
        hobbys.append(hobby)
    }
    func remove(hobby: Hobby) {
        if let index = hobbys.firstIndex(of: hobby) {
            hobbys.remove(at: index)
        }
    }
    func add(friend: AddressCard) {
        freunde.append(friend.id)
    }
    func remove(friend: AddressCard) {
        if let index = freunde.firstIndex(of: friend.id) {
            freunde.remove(at: index)
        }
    }
}
