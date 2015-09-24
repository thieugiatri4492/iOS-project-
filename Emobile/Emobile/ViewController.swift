
import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginbutton: UIButton!
    var imageView: UIImageView!;
   
//    let bgImage = UIImage(named: "loginbg.png");
    
    @IBAction func loginPress(sender: UIButton){
        self.username.resignFirstResponder();
        self.password.resignFirstResponder();
        
        
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }
    override func  viewDidLoad() {
        super.viewDidLoad();
        
//        username.setId("username");
//        username.setImage();
//        password.setImage();
        
        //background image handle
        
//       imageView = UIImageView(frame: view.bounds);
//        imageView.contentMode = .ScaleAspectFill;
//        imageView.clipsToBounds = true;
//        imageView.image = bgImage;
//        imageView.center = CGPointMake(view.bounds.midX, view.bounds.midY);
//       
//        
//        imageView.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth;
//        
//        
//        view.addSubview(imageView);
//        self.view.sendSubviewToBack(imageView);
        
        
        
        
    }
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int{
        return UIInterfaceOrientation.Portrait.rawValue
    }
    /*override func viewWillAppear(animated: Bool){
        
        //navigation bar handle
        self.navigationController?.setNavigationBarHidden(true, animated: false);
     }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.navigationController?.setNavigationBarHidden(true, animated: false);
    }*/
}

