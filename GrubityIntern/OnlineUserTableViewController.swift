//
//  OnlineUserTableViewController.swift
//  GrubityIntern
//
//  Created by DUY on 7/18/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit
import Firebase

class OnlineUserTableViewController: UITableViewController {

    var currentUsers: [String] = []
    var userRef = Database.database().reference(withPath: "online")
    override func viewDidLoad() {
        super.viewDidLoad()

        userRef.observe(.childAdded, with: { snap in
            guard let email = snap.value as? String else { return }
            self.currentUsers.append(email)
            let row = self.currentUsers.count - 1
            let indexPath = IndexPath(row: row, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .top)
        })
        userRef.observe(.childRemoved, with: { snap in
            guard let emailToFind = snap.value as? String else { return }
            for (index, email) in self.currentUsers.enumerated() {
                if email == emailToFind {
                    let indexPath = IndexPath(row: index, section: 0)
                    self.currentUsers.remove(at: index)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        })
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentUsers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let onlineUserEmail = currentUsers[indexPath.row]
        cell.textLabel?.text = onlineUserEmail
        return cell
    }

    @IBAction func signOutButtonDidTouch(_ sender: AnyObject) {
        let user = Auth.auth().currentUser!
        let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
        onlineRef.removeValue { (error, _) in
            if let error = error {
                print("Removing online failed: \(error)")
                return
            }
            do {
                try Auth.auth().signOut()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "SignInVC") as SignInViewController
                var vcArray = self.navigationController?.viewControllers
                vcArray?.removeAll()
                vcArray?.append(vc)
                self.navigationController?.setViewControllers(vcArray!, animated: true)
            } catch (let error) {
                print("Auth sign out failed: \(error)")
            }
        }
    }
}
