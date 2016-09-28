//
//  ViewController.swift
//  segues
//
//  Created by Margaret Ikeda on 9/28/16.
//  Copyright © 2016 Margaret Ikeda. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let data = ["red", "green", "blue", "cyan", "magenta", "amber", "yellow", "black"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
    
    cell.textLabel?.text=data[indexPath.row]
    return cell
}
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
       if let colorViewController = segue.destination as? ColorViewController {
        if let indexPath = tableView.indexPathForSelectedRow {
            colorViewController.color = data[indexPath.row]
        }
    }
}

}
