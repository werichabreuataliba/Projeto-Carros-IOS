//
//  DetalhesCarroViewController.swift
//  Carros
//
//  Created by Macbook on 08/05/17.
//  Copyright © 2017 Werich. All rights reserved.
//

import UIKit

class DetalhesCarroViewController: UIViewController {

    
    @IBOutlet weak var labelDescricaoCarro: UILabel!
    @IBOutlet weak var fotoCarro: UIImageView!
    var carroDetalhado:Carro!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelDescricaoCarro.text = carroDetalhado.desc
        do{
        let data = try Data(contentsOf: URL(string: carroDetalhado.url_foto)!)
            self.fotoCarro.image = UIImage(data:data)
        }
            catch let erro as NSError
            {
                print("Erro: \(erro.description)")
            }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
