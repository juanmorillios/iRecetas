//
//  ViewController.swift
//  iRecetas
//
//  Created by Juan Morillo on 12/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //Array donde almacenaremos todas las recetas
    var recetas : [Recetas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        
      
        //Lista de recetas  a mostrar
        var receta = Recetas(nombre: "Ensalada Rusa",
                             image: #imageLiteral(resourceName: "ensalada"),
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
    

    
    // MARK: UITableViewDataSource
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
        return recetas.count
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
      let recetas = self.recetas[indexPath.row]
    
      let cellID = "cellIdentifier"
        
      let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecetaCell
     // cell.textLabel?.text = recetas.nombre
     // cell.imageView?.image = recetas.image
       
        cell.smallimage.image = recetas.image
       cell.nameLabel.text = recetas.nombre
       cell.ingredientesLabel.text = "Ingredientes: \(recetas.ingredientes.count)"
       cell.timeLabel.text = "\(recetas.tiempoCocion!) min."
       
        //Aplicar cambios a la imagen para que sea Circular por código
       //cell.smallimage.layer.cornerRadius = 42.0
       //cell.smallimage.clipsToBounds = true
       
        
        //Asignamos la imagen que representa fvorito a la receta.
        if recetas.isFavorite {
        
            cell.accessoryType = .checkmark
            
        
        } else {
        
            cell.accessoryType = .none
        
        }
        
        
        return cell
    
    }
    
    
    //MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let receta = self.recetas[indexPath.row]
        
        
        let alertViewController = UIAlertController(title: "\(receta.nombre!)", message: "Valora ésta receta", preferredStyle: .alert)
        
        
        var favoriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        
        
        if receta.isFavorite {
        
        favoriteActionTitle = "No es favorito"
        favouriteActionStyle = UIAlertActionStyle.destructive
       
        }
        
    
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: favouriteActionStyle) {(action) in
            
        //Recuperamos el número de celda seleccionada
        let receta = self.recetas[indexPath.row]
        
        //Cambiamos el estado de la receta de normal a favorita
        receta.isFavorite = !receta.isFavorite
        
        //Actualizamos toda la tabla después de haber seleccionada como receta favorita
        self.tableView.reloadData()
        
        
    }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertViewController.addAction(cancelAction)
        
        alertViewController.addAction(favoriteAction)
        self.present(alertViewController, animated: true, completion: nil)
        
    }
    


  
  
  }




    
