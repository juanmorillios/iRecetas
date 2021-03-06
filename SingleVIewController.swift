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
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.rowHeight = 175
        //Lista de recetas  a mostrar
        var receta = Recetas(nombre: "Sancocho Dominicano",
                             image: #imageLiteral(resourceName: "Sancocho"),
                             tiempoCocion: 12,
                             ingredientes: ["1 libra carne de chivo","1 libra longaniza","1 libra carne de cerdo", "2 libras carne de res con hueso", "1 pollo entero de 2 libras", "2 libras de costilas"],
                             pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
        receta = Recetas(nombre: "Pasteles en Hoja", image: #imageLiteral(resourceName: "pasteles"),
                         tiempoCocion: 12,
                         ingredientes: ["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
        receta = Recetas(nombre: "Habichuelas con dulce", image: #imageLiteral(resourceName: "Habichuelas "),
                         tiempoCocion: 12,
                         ingredientes: ["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
        receta = Recetas(nombre: "Pastelón de Carne", image: #imageLiteral(resourceName: "Pastelon"),
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
  
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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


 func prefersStatuBarHidden() -> Bool {
    
    return true
    
}



