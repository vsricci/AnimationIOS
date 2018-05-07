//
//  ViewController.swift
//  TestAppAnimation
//
//  Created by Vinicius Ricci on 5/4/18.
//  Copyright © 2018 Vinicius Ricci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnmyLists: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackSearchLists: UIStackView!
    @IBOutlet weak var stackCreateLists: UIStackView!
    @IBOutlet weak var serachView: UIView!
    @IBOutlet weak var createView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewCustom: UIView!
    
    var valuesArray = [String]()
    var topConst: NSLayoutConstraint!
    var heightConst: NSLayoutConstraint!
    var topConst2: NSLayoutConstraint!
    var bottomConst: NSLayoutConstraint!
    
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat

    var const = NSLayoutConstraint()
    
    var heightCustom = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize = CGSize(width: scrollViewContentHeight, height: scrollViewContentHeight)
        self.tableView.contentSize = CGSize(width: self.tableView.frame.size.width, height: self.tableView.contentSize.height)
       tableView.isHidden = true
       scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        scrollView.bounces = true
        tableView.bounces = false
        tableView.tableFooterView = UIView()
        //tableView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    

//    func teste(){
//        let teste1 = Int(self.tableView.bounds.size.height)*self.valuesArray.count
//        if self.valuesArray.count == 1 {
//            print(self.valuesArray.count)
//
//            print(teste1)
//
//             const = NSLayoutConstraint(item: self.tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 60)
//            self.stackView.addConstraint(const)
//
//        }
//        else {
//
//            const = NSLayoutConstraint(item: self.tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: CGFloat(teste1))
//            self.stackView.addConstraint(const)
//        }
//    }

    
    func getValues() {
        
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        
        
        
       
        
        
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
    }
    
   

   
    @IBAction func tappedMyLists(_ sender: UIButton) {
        if sender.isSelected {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.tableView.isHidden = true
                self.valuesArray.removeAll()
                print("clicked closed my lists")
                
            }) { (resut) in
                
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
                self.viewCustom.removeConstraint(self.const)
                
            }) { (resut) in
                 self.viewCustom.removeConstraint(self.const)
            }
            
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.getValues()
                print(self.valuesArray.count)
                self.heightCustom = Int(120)*self.valuesArray.count
                if self.valuesArray.count == 1 {
                    
                    self.const = NSLayoutConstraint(item: self.tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 100)
                    self.viewCustom.addConstraint(self.const)
                }
                else {
                   
                    self.const = NSLayoutConstraint(item: self.tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: CGFloat(self.heightCustom))
                    self.viewCustom.addConstraint(self.const)
                }
                self.tableView.isHidden = false
                print("clicked open my lists")
                
            }) { (resut) in
                
            }
            
        }
        sender.isSelected = !sender.isSelected
        
    }
    
    @IBAction func tappedSearchLists(_ sender: UIButton) {
        if sender.isSelected {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                //  self.addConstraints()
               self.serachView.isHidden = true
                print("clicked closed search lists")
            }) { (resut) in
                
            }
            
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                //  self.updateContraints()
                self.serachView.isHidden = false
                print("clicked open search lists")
                
            }) { (resut) in
                
            }
            
        }
        sender.isSelected = !sender.isSelected
        
    }
    
    @IBAction func tappedCreateLists(_ sender: UIButton) {
        if sender.isSelected {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                //  self.addConstraints()
                self.createView.isHidden = true
                print("clicked closed create lists")
            }) { (resut) in
                
            }
            
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                //  self.updateContraints()
                self.createView.isHidden = false
                print("clicked open create lists")
                
            }) { (resut) in
                
            }
            
        }
        sender.isSelected = !sender.isSelected
        
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.valuesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let items  = self.valuesArray[indexPath.row]
        cell.textLabel?.text = items
        cell.contentView.clearSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120.0
    }
}

extension UIView
{
    func clearSubviews()
    {
        for subview in self.subviews as! [UIView] {
            subview.removeFromSuperview();
        }
    }
}

extension ViewController : UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.bounds.intersects(UIView().frame) == true {
            self.scrollView.contentOffset = scrollView.contentOffset
            if tableView.contentOffset.y == 0 {
                tableView.isUserInteractionEnabled = true
                tableView.resignFirstResponder()
                print("using scrollView scroll")
               
                
            } else {
                tableView.isUserInteractionEnabled = true
                scrollView.resignFirstResponder()
              //  self.tableView.contentSize = CGSize(width: self.tableView.frame.size.width, height: self.tableView.contentSize.height)
                scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.tableView.bounds.size.height+self.stackView.bounds.size.height+self.stackView.bounds.size.height-100)
                print("using tableView scroll")
            }
            
        } else {
            tableView.isUserInteractionEnabled = true
            scrollView.resignFirstResponder()
            self.tableView.contentSize = CGSize(width: self.tableView.frame.size.width, height: self.tableView.contentSize.height)
          
            
        }

         if self.serachView.isHidden == true && self.tableView.isHidden == true && self.createView.isHidden == true {
            
            self.scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: 667)
            
        }
         else if self.tableView.isHidden == false && self.createView.isHidden == true && self.serachView.isHidden == true{
             self.scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: CGFloat(heightCustom)+self.stackView.bounds.size.height+self.stackCreateLists.bounds.size.height+self.createView.bounds.size.height+30)
        }
         else if self.tableView.isHidden == false && self.createView.isHidden == false && self.serachView.isHidden == false {
            self.scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: CGFloat(heightCustom)+self.stackView.bounds.size.height+self.stackCreateLists.bounds.size.height+self.createView.bounds.size.height-70)
        }
    }
}



