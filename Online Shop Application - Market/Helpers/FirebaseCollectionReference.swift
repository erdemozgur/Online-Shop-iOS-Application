//
//  FirebaseCollectionReference.swift
//  Online Shop Application - Market
//
//  Created by Erdem Özgür on 9.04.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import Foundation
import FirebaseFirestore

//EO1.0 - creating firebase references

enum FCollectionReference: String {
    case User
    case Category
    case Items
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
    
}
