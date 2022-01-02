//
//  AddressBook.swift
//  iOS3_Chu_Luedecke
//
//  Created by  on 24.11.21.
//

import Foundation

class AddressBook: Codable {
    var book = [AddressCard]()
    
    func add(card: AddressCard) {
        book.append(card)
    }
    func remove(card: AddressCard) {
        if let index = book.firstIndex(of: card) {
            book.remove(at: index)
        }
    }
    func sort(){
        book.sort { s1, s2 -> Bool in
            s1.nachName < s2.nachName
        }
    }
    //gibt nur die erste Person mit dem gesuchten Nachnamen aus
    func searchLastName(searchTerm: String) -> AddressCard? {
        for search in book{
            if search.nachName == searchTerm{
                return search
            }
        }
        print("Diese Person ist nicht im Adressbuch")
        return nil
    }
    func searchID(searchTerm: UUID) -> AddressCard? {
        for search in book{
            if search.id == searchTerm{
                return search
            }
        }
        return nil
    }
    func friendsOf(card: AddressCard) -> [AddressCard] {
        var result = [AddressCard]()
        for i in card.freunde {
            if let x = searchID(searchTerm: i){
                result.append(x)
            }
        }
        return result
    }
    func save(toFile path: String) {
        let addressbook = self
        
        let url = URL(fileURLWithPath: path)
        
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(addressbook) {
            try? data.write(to: url)
        }
    }
    class func addressBook(fromFile path: String) -> AddressBook?{
        let url = URL(fileURLWithPath: path)
        
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let addressbook = try? decoder.decode(AddressBook.self, from: data) {
                return(addressbook)
            }
        }
        print("no data read")
        return nil
    }
}


