//
//  main.swift
//  iOS3_Chu_Luedecke
//
//  Created by  on 24.11.21.
//

import Foundation

func read(withPrompt: String) -> String{
    print(withPrompt, terminator: " ")
    return readLine() ?? ""
}

func newHobby(addressCard: AddressCard){
    while(true){
        let s = read(withPrompt: "Hobby: (Abbruch mit (Q))")
        if(s.capitalized == "Q"){break}
        addressCard.add(hobby: Hobby(name: s))
    }
}

func newCard(addressBook: AddressBook){
    let addressCard = AddressCard(vorName: read(withPrompt: "Vorame:"),
                                  nachName: read(withPrompt: "Nachname:"),
                                  strasse: read(withPrompt: "Strasse:"),
                                  postLeitZahl: Int(read(withPrompt: "PLZ:")) ?? 0,
                                  ort: read(withPrompt: "Ort:"))
    newHobby(addressCard: addressCard)
    addressBook.add(card: addressCard)
    addressBook.sort()
}

func searchCard(addressBook:AddressBook){
    
    let card = addressBook.searchLastName(searchTerm: read(withPrompt: "Suchname:"))
    showCard(addressCard: card!)
    while(true){
        let option = read(withPrompt: "(F)reund/in hinzufügen, (L)öschen, (Z)urück")
        if(option.capitalized == "F") {
            let tempCard = addressBook.searchLastName(searchTerm: read(withPrompt: "Name Freund/in:"))
            if let friendCard = addressBook.searchID(searchTerm: tempCard!.id){
                card?.add(friend: friendCard)
                print("Freund/in wurde hinzugefügt")
            }else{
                print("Freund/in konnte nicht hinzugefügt werden.")
            }
        }
        if(option.capitalized == "L") {
            if(card != nil){
                for i in addressBook.book{
                    for j in i.freunde{
                        if j==card!.id {
                            i.remove(friend: card!)
                        }
                    }
                }
                addressBook.remove(card: card!)
                print("Person wurde gelöscht.")
            }else{
                print("Karte konnte nicht gelöscht werden.")
            }
        }
        if(option.capitalized == "Z"){
            break
        }
    }
}

func showCard(addressCard: AddressCard){
    print("❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤")
    print("▸ " + addressCard.vorName + " " + addressCard.nachName)
    print("▸ " + addressCard.strasse)
    print("▸ " + String(addressCard.postLeitZahl) + " " + addressCard.ort)
    print("▸ Hobbys:" )
    for hobby in addressCard.hobbys{
        print("   • " + hobby.name)
    }
    print("▸ Freunde:" )
    for friendID in addressCard.freunde{
        if let friend = addressBook.searchID(searchTerm: friendID){
            print("   • " + friend.vorName + " " + friend.nachName)
        }
    }
    print("❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤")
}

func listOfCards(addressBook: AddressBook){
    for i in addressBook.book{
        showCard(addressCard: i)
    }
}

let addressBook = AddressBook.addressBook(fromFile: "book.plist") ?? AddressBook()
while(true){
    addressBook.save(toFile: "book.plist")
    
    let option = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?")
    if(option.capitalized == "E") {newCard(addressBook: addressBook)}
    if(option.capitalized == "S") {searchCard(addressBook: addressBook)}
    if(option.capitalized == "L") {listOfCards(addressBook: addressBook)}
    if(option.capitalized == "Q") {
        addressBook.save(toFile: "book.plist")
        break
    }
}
