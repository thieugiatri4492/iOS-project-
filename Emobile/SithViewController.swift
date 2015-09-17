

import UIKit

class SithViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet weak var tablemenu: UITableView!
    
    let menulist = ["Tra cứu thông tin giá điện","Tra cứu thông tin chỉ số","Tra cứu thông tin hoá đơn","Tra cứu thông tin nợ tiền điện","Tra cứu thông tin thanh toán tiền điện"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tablemenu.dataSource = self;
        self.tablemenu.delegate = self;
        self.tablemenu.registerClass(UITableViewCell.self, forCellReuseIdentifier: "prototype1");
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return  self.menulist.count;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let theCell:UITableViewCell = tablemenu.dequeueReusableCellWithIdentifier("prototype1", forIndexPath: indexPath) as!UITableViewCell
        
        theCell.textLabel?.text = menulist[indexPath.row];
        
        return theCell;
    }
    //cell selected 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tablemenu.indexPathForSelectedRow();
        let currentCell = tablemenu.cellForRowAtIndexPath(indexPath!);
        if(currentCell?.textLabel?.text == "Tra cứu thông tin giá điện"){
            self.performSegueWithIdentifier("seventhSegue", sender: self)
        }
        else if(currentCell?.textLabel?.text == "Tra cứu thông tin chỉ số")
        {
                self.performSegueWithIdentifier("eigthSegue", sender: self)
        }
    }
    //stop rotate
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int{
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    
    
    

}
