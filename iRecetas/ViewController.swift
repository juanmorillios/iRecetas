//
//  ViewController.swift
//  iRecetas
//
//  Created by Juan Morillo on 12/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recetas : [Recetas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       var receta = Recetas(nombre: "Ensalada Rusa")
        recetas.append(receta)
    
        receta = Recetas(nombre: "Pollo alast")
        recetas.append(receta)
        
        receta = Recetas(nombre: "Pizza Napolitana")
        recetas.append(receta)
        
        receta = Recetas(nombre: "Paellla a la Valenciana")
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
        
      let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
      cell.textLabel?.text = recetas.nombre
        
        return cell
    
    }
    


  
  }




    
