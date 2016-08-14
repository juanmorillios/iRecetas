//
//  SingleVIewController.swift
//  iRecetas
//
//  Created by Juan Morillo on 14/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class SingleVIewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    //Array donde almacenaremos todas las recetas
    var recetas : [Recetas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 150
        
        //Lista de recetas  a mostrar
        var receta = Recetas(nombre: "Ensalada Rusa",
                             image: #imageLiteral(resourceName: "paella"),
                             tiempoCocion: 12,
                             ingredientes: ["Patata","Huevos","Margarina"],
                             pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
        receta = Recetas(nombre: "Pollo alast", image: #imageLiteral(resourceName: "pollo"),
                         tiempoCocion: 12,
                         ingredientes: ["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
        receta = Recetas(nombre: "Pizza Napolitana", image: #imageLiteral(resourceName: "pizza"),
                         tiempoCocion: 12,
                         ingredientes: ["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
        receta = Recetas(nombre: "Paellla a la Valenciana", image: #imageLiteral(resourceName: "paella"),
                         tiempoCocion: 12,
                         ingredientes:["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
    }
    
    
        
    }

extension SingleVIewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    // MARK: UITableViewDataSource
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return recetas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recetas = self.recetas[indexPath.row]
        
        let cellID = "cellIdentifier"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecetaCompletaTableViewCell
        
        
        cell.tituloRecetaLabel.text = recetas.nombre
        cell.portadaRecetaImage.image = recetas.image
        
        
        
        
        // cell.textLabel?.text = recetas.nombre
        // cell.imageView?.image = recetas.image
        
        /* cell.smallimage.image = recetas.image
         cell.nameLabel.text = recetas.nombre
         cell.ingredientesLabel.text = "Ingredientes: \(recetas.ingredientes.count)"
         cell.timeLabel.text = "\(recetas.tiempoCocion!) min." */
        
        //Aplicar cambios a la imagen para que sea Circular por código
        //cell.smallimage.layer.cornerRadius = 42.0
        //cell.smallimage.clipsToBounds = true
        
        
        return cell
        
    }
  
    

}



