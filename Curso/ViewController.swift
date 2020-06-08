//
//  ViewController.swift
//  Curso
//
//  Created by mbtec22 on 6/6/20.
//  Copyright © 2020 dquispeo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var cursos:[Curso] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.lightGray
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCurso()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        cell.textLabel?.text = curso.nombre
        
        let doublee:Double = Double(curso.examen!)!
        
        if doublee>=13.00{
            cell.backgroundColor = UIColor.init(red: 000, green: 999, blue: 000, alpha: 0.2)
        }else if doublee<13.00{
                cell.backgroundColor = UIColor.init(red: 999, green: 000, blue: 000, alpha: 0.2)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "detalleSegue", sender: curso)
    }
    
    @IBAction func nuevoCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerCurso(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        }catch{
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalleSegue"{
            let siguienteVC = segue.destination as! DetalleCursoViewController
            siguienteVC.curso = sender as! Curso
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let curso = cursos[indexPath.row]
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(curso)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                cursos = try context.fetch(Curso.fetchRequest())
                tableView.reloadData()
            }catch{}
        }
    }

}

