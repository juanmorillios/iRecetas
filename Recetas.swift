//
//  Recetas.swift
//  iRecetas
//
//  Created by Juan Morillo on 12/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class Recetas: NSObject {
   
    var nombre: String!
    var image : UIImage!
    var tiempoCocion : Int!
    var ingredientes : [String]!
    var pasos : [String]!
    
    init(nombre: String) {
      self.nombre = nombre
    
    }
    
}


