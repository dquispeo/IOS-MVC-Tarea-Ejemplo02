//
//  DetalleCursoViewController.swift
//  Curso
//
//  Created by mbtec22 on 6/6/20.
//  Copyright © 2020 dquispeo. All rights reserved.
//

import UIKit

class DetalleCursoViewController: UIViewController {
    
    var curso : Curso? = nil

    @IBOutlet weak var lblCursoNombre: UILabel!
    @IBOutlet weak var lblCursoPromPra: UILabel!
    @IBOutlet weak var lblCursoPromLab: UILabel!
    @IBOutlet weak var lblCursoExamen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if curso != nil{
            lblCursoNombre.text = "\(curso!.nombre!)"
            lblCursoPromPra.text = "\(curso!.prompra!)"
            lblCursoPromLab.text = "\(curso!.promlab!)"
            lblCursoExamen.text = "\(curso!.examen!)"
        }else{
            lblCursoNombre.text = curso!.nombre!
            lblCursoPromPra.text = curso!.prompra!
            lblCursoPromLab.text = curso!.promlab!
            lblCursoExamen.text = curso!.examen!
        }
    }

}
