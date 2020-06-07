//
//  CrearCursoViewController.swift
//  Curso
//
//  Created by mbtec22 on 6/6/20.
//  Copyright © 2020 dquispeo. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var txtCursoNombre: UITextField!
    @IBOutlet weak var txtCursoPromPra: UITextField!
    @IBOutlet weak var txtCursoPromLab: UITextField!
    @IBOutlet weak var txtCursoExamen: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let curso = Curso(context: context)
        curso.nombre = txtCursoNombre.text!
        curso.prompra = txtCursoPromPra.text!
        curso.promlab = txtCursoPromLab.text!
        curso.examen = txtCursoExamen.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
}
