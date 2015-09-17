import Foundation;
import UIKit;

class CustomTextField: UITextField {
    var imageView = UIImageView();
    var image = UIImage(named: "user-icon.png");
    var image2 = UIImage(named: "pass-icon.png");
    var ident = "password";
    
    func getId() ->String {
        return self.ident;
    }
    func setId(ident : String){
        self.ident = ident;
        
    }
    
    func setImage(){
        if(self.getId() == "username"){
            imageView.image = image;
            imageView.frame = CGRect (x: 0, y: 0, width: 25, height: 25);
        }
        else {
            imageView.image = image2;
            imageView.frame = CGRect (x: 0, y: 0, width: 25, height: 25);
        }
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = UIColor.grayColor().CGColor;
        self.layer.borderWidth = 1.5;
        
        
        
        
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewMode.Always;
        self.addSubview(imageView);
        
        self.textColor = UIColor.blackColor();
        self.tintColor = UIColor.purpleColor();
    }
}
