//
//  Recetas.swift
//  iRecetas
//
//  Created by Juan Morillo on 12/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class Recetas: NSObject {
   
    //Creamos la propiedades del objeto
    var nombre: String!
    var image : UIImage!
    var tiempoCocion : Int!
    var ingredientes : [String]!
    var pasos : [String]!
    
    
    //Creamos el constructor de la clase
    init(nombre: String) {
      self.nombre = nombre
    
    }
    
}


