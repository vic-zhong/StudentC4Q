//
//  loginViewController.swift
//  C4QStudentBook
//
//  Created by Victor Zhong on 10/5/16.
//  Copyright © 2016 Victor Zhong. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate {
	var students = [Student]()
	var whichStudent: Student!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		for studentDict in ac32_students {
			let student = Student(studentDict: studentDict)
			students.append(student)
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	

	@IBAction func loginButtonTapped(_ sender: UIButton) {
		//		guard let emailString = emailField.text else { return }
		//		let doesExist = students.contains { (student) -> Bool in
		//			return emailString == student.info.email
		//		}
		//		if doesExist {
		//			// segue to tableview
		//		} else {
		//			// throw a warning or alert
		
		guard let emailString = emailField.text else { return }
		guard let pwEntered = passwordField.text else { return }
		
		guard let student = students.filter({ $0.info.email == emailString }).first else {
			//throw an alert to put in a valid email
			return
		}
		
		if pwEntered == String(student.id) {
			whichStudent = student
			performSegue(withIdentifier: "loginSegue", sender: student)
		} else {
			// throw an alert in regard to invalid pw
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "loginSegue" {
			let stvc = segue.destination as? StudentsTableViewController
			 stvc?.currentStudent = sender as? Student
		}
	}
	
//	if let gvc = segue.destination as? GesturesViewController {
//		gvc.correctColor = UIColor(red: CGFloat(correctColorComponents.red),
		
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
}
