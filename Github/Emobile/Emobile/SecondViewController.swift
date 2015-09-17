

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       /* var topbg = UIImage(named: "top-bg1.png");
        self.navigationController?.navigationBar.setBackgroundImage(topbg, forBarMetrics: .Default);*/
    }
   /* override func viewWillAppear(animated: Bool){
        
        //navigation bar handle
        self.navigationController?.setNavigationBarHidden(false, animated: true);
    }*/
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int{
        return UIInterfaceOrientation.Portrait.rawValue
    }
}
