//
//  TableViewCarrosControllerTableViewController.swift
//  Carros
//
//  Created by Macbook on 07/05/17.
//  Copyright © 2017 Werich. All rights reserved.
//

import UIKit

class TableViewCarrosControllerTableViewController: UITableViewController {
    
    var carros: Array<Carro> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carros = CarroService.getCarrosByTipoFromFile(tipo: "esportivos")
        
         let xib = UINib(nibName: "CarroCellTableViewCell", bundle: nil)
        self.tableView.register(xib, forCellReuseIdentifier: "celulaReuso")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var carro:Carro
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath) as! CarroCellTableViewCell
        
        carro = carros[indexPath.row] as Carro
    
        do {
        let data = try Data(contentsOf: URL(string:carro.url_foto)!)
            cell.fotoCarro.image = UIImage(data: data)
        }
        catch let erro as NSError
        {
            print("Erro: \(erro.description)")
        }
        
        cell.labelTituloCarro.text = carro.nome
        cell.labelDescricaoCarro.text = carro.desc
        
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carro = carros[indexPath.row] as Carro
        let vc = DetalhesCarroViewController(nibName: "DetalhesCarroViewController", bundle: nil)
        vc.carroDetalhado = carro
        self.navigationController!.pushViewController(vc, animated: true)
    }*/

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Entrou")
        if segue.identifier == "detalhesCarro" {
            if let indexSelectedIndex = tableView.indexPathForSelectedRow{
                let detalhesCarros =  segue.destination as! DetalhesCarroViewController
                detalhesCarros.carroDetalhado = carros[indexSelectedIndex.row] as Carro
                
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
