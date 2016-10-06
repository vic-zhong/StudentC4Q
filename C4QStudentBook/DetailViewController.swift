//
//  DetailViewController.swift
//  C4QStudentBook
//
//  Created by Victor Zhong on 9/30/16.
//  Copyright © 2016 Victor Zhong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		setupData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	var student: Student?
	var linkedinAcct: String?
	var githubAcct: String?
	
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var studentIDLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var funFactTextView: UITextView!
	@IBAction func linkedinButtonTapped(_ sender: UIButton) {
		guard let linkedin = linkedinAcct else { return }
		let linkedinURLString = "https://www.linkedin.com/in/\(linkedin)"
		guard let url = URL(string: linkedinURLString) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
	@IBAction func githubButtonTapped(_ sender: UIButton) {
		guard let github = githubAcct else { return }
		let githubURLString = "https://www.github.com/\(github)"
		guard let url = URL(string: githubURLString) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
	
	func setupData() {
		guard let stu = student else { return }
		self.navigationItem.title = stu.info.firstName + " " + stu.info.lastName
		emailLabel.text = "Email: " + stu.info.email
		studentIDLabel.text = "Student ID: " + String(stu.id)
		funFactTextView.text = stu.funFact
		profileImageView.image = UIImage(named: stu.info.imageName)
		linkedinAcct = stu.linkedin
		githubAcct = stu.github
		profileImageView.layer.cornerRadius = 100
		profileImageView.layer.masksToBounds = true
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
