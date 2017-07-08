//
//  ViewController.swift
//  Carros
//
//  Created by Macbook on 06/05/17.
//  Copyright © 2017 Werich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var carros: Array<Carro> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carros = CarroService.getCarrosByTipoFromFile(tipo: "esportivos")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detlahe = DetalhesCarroViewController()
        detlahe.carroDetalhado = carros[indexPath.row] as Carro!
        self.navigationController?.pushViewController(detlahe, animated: true)
    }
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carros.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var carro:Carro
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath) as! CelulaCarro
        
        carro = carros[indexPath.row]
        
        cell.labeltituloCarro.text = carro.nome
        cell.labelDescricaoCarro.text = carro.desc
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "detalhesCarro" {
     if let indexSelectedIndex =  self.tab tableView.indexPathForSelectedRow{
     let detalhesCarros =  segue.destination as! DetalhesCarroViewController
     detalhesCarros.carroDetalhado = carros[indexSelectedIndex.row] as Carro
     
      }
     }*/
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     //}
 
    
}
