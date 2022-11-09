//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 08.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var surNameLable: UILabel!
    @IBOutlet weak var liveInLable: UILabel!
    @IBOutlet weak var workLable: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var name = ""
    var surName = ""
    var livaIn = ""
    var work = ""
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.title = "О себе"
    }
    
    @IBAction func detailAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showToDetail", sender: nil)
        
    }
    
    private func prepareView() {
        imageView.image = UIImage(named: "Cat")
        imageView.layer.borderWidth = 3
        nameLable.text = name
        surNameLable.text = surName
        liveInLable.text = livaIn
        workLable.text = work
    }
}
