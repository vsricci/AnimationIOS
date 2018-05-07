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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewCustom: UIView!
    
    var valuesArray = [String]()
    var topConst: NSLayoutConstraint!
    var heightConst: NSLayoutConstraint!
    var topConst2: NSLayoutConstraint!
    var bottomConst: NSLayoutConstraint!
    
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat

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
        //tableView.isScrollEnabled = false
        
       // tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       // scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: 1000)
//        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.contentSize.height)
        
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if let tableView = object as? UITableView {
//            if tableView == self.tableView && keyPath == "contentSize" {
//                // Now you know that the content size for self.tableView changed.
//                // Do your frame updation here
//
//            }
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
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
        self.valuesArray.append("Teste")
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
    
    func addConstraints(){
//        self.stackView.axis = .vertical
//        self.stackView.distribution = .equalCentering
        
         topConst = NSLayoutConstraint(item: self.stackView, attribute: .top, relatedBy: .equal, toItem: self.viewCustom, attribute: .top, multiplier: 1.0, constant: 216)
       //  heightConst = NSLayoutConstraint(item: self.stackView, attribute: .bottom, relatedBy: .equal, toItem: self.viewCustom, attribute: .bottom, multiplier: 1.0, constant: 16)
        self.viewCustom.addConstraint(topConst)
        //self.viewCustom.addConstraint(heightConst)
        self.viewCustom.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        

    }
    
    func updateContraints() {
//        self.stackView.axis = .vertical
//        self.stackView.distribution = .equalCentering
        
             topConst2 = NSLayoutConstraint(item: self.stackView, attribute: .top, relatedBy: .equal, toItem: self.viewCustom, attribute: .top, multiplier: 1.0, constant: 216)
        //heightConst = NSLayoutConstraint(item: self.stackView, attribute: .bottom, relatedBy: .equal, toItem: self.viewCustom, attribute: .bottom, multiplier: 1.0, constant: 16)
       // self.viewCustom.addConstraint(heightConst)
             //bottomConst = NSLayoutConstraint(item: self.stackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: self.viewCustom.bounds.size.height-16)
        self.viewCustom.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            //self.heightConst.isActive = false
            self.viewCustom.addConstraint(topConst2)
           // self.viewCustom.addConstraint(bottomConst)
      //  self.viewCustom.addConstraint(heightConst)
            //self.viewCustom.removeConstraint(topConst)

        
      
    }

   
    @IBAction func tappedMyLists(_ sender: UIButton) {
        if sender.isSelected {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
              //  self.addConstraints()
                self.tableView.isHidden = true
                self.valuesArray.removeAll()
                print("clicked")
            }) { (resut) in
                
            }
            
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
              //  self.updateContraints()
                self.getValues()
                self.tableView.isHidden = false
                
                
                print("clicked2")
                
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
        
        return 100.0
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
            //the UIView is within frame, use the UIScrollView's scrolling.
            self.scrollView.contentOffset = scrollView.contentOffset
            if tableView.contentOffset.y == 0 {
                //tableViews content is at the top of the tableView.
                
                tableView.isUserInteractionEnabled = true
                tableView.resignFirstResponder()
                print("using scrollView scroll")
               // scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.tableView.bounds.size.height+self.stackView.bounds.size.height+self.stackView.bounds.size.height-100)
                
            } else {
                
                //UIView is in frame, but the tableView still has more content to scroll before resigning its scrolling over to ScrollView.
                
                tableView.isUserInteractionEnabled = true
                scrollView.resignFirstResponder()
                //tableView.isScrollEnabled = true
                //tableView.alwaysBounceVertical = true
                self.tableView.contentSize = CGSize(width: self.tableView.frame.size.width, height: self.tableView.contentSize.height)
                scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.tableView.bounds.size.height+self.stackView.bounds.size.height+self.stackView.bounds.size.height-100)
                print("using tableView scroll")
            }
            
        } else {
            
            //UIView is not in frame. Use tableViews scroll.
            
            tableView.isUserInteractionEnabled = true
            scrollView.resignFirstResponder()
            //tableView.isScrollEnabled = true
            //tableView.alwaysBounceVertical = true
            self.tableView.contentSize = CGSize(width: self.tableView.frame.size.width, height: self.tableView.contentSize.height)
          //  print("using tableView scroll")
            
        }
        if self.tableView.isHidden == true {
            scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: 800)
        }
        else {

             //self.tableView.alwaysBounceVertical = true
            scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.tableView.bounds.size.height+self.stackView.bounds.size.height+self.stackView.bounds.size.height-100)
        }
        
    }
}



