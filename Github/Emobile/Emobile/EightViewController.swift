

import UIKit

class EightViewController: UIViewController,UIPickerViewDataSource,PopUpPickerViewDelegate,UITextFieldDelegate{

   
    
    var picker1: CustomPickerView!
    var picker2: CustomPickerView!
    var picker3: CustomPickerView!
    
    @IBOutlet weak var txtKy: UITextField!
    
    @IBOutlet weak var txtNam: UITextField!
    @IBOutlet weak var txtThang: UITextField!
    
    @IBOutlet weak var txtKy2: UITextField!
    
    @IBOutlet weak var txtThang2: UITextField!
    
    @IBOutlet weak var txtNam2: UITextField!
    let data = ["1","2","3"];
    var month:[Int] = [];
    var years:[Int] = []
    var choose2: Bool?
    var choose1:Bool?
    
    @IBOutlet weak var tableCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
        //initialize month
        for i in 1...12{
            month.append(i);
        }
        //get current year 
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitYear, fromDate: date)
        let year = components.year
        println(year)
        // initialize year 
        for i in 1990...year{
            years.append(i)
        }
        //picker initialize
        picker1 = CustomPickerView()
        picker1.delegate = self
        self.view.addSubview(picker1)
        
        picker2 = CustomPickerView()
        picker2.delegate = self
        self.view.addSubview(picker2)
        
        picker3 = CustomPickerView()
        picker3.delegate = self
        self.view.addSubview(picker3)
        
        //text field handle
        txtKy.text = data[0];
        txtKy.delegate = self;
        
        
        txtThang.text = String(month[0]);
        txtThang.delegate = self;
        
        txtNam.text = String(years[0])
        txtNam.delegate = self
        
        txtKy2.text = data[0];
        txtKy2.delegate = self;
        
        
        txtThang2.text = String(month[0]);
        txtThang2.delegate = self;
        
        txtNam2.text = String(years[0])
        txtNam2.delegate = self
        // Do any additional setup after loading the view.
    }
    
        //Picker configuration
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == picker2.getPicker() ){
            
            return month.count;
        }
        else if (pickerView == picker3.getPicker()){
            return years.count
        }
        else{
            return data.count;
        }
       
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(pickerView == picker2.getPicker() ){
            return String(month[row]);
        }
        else if (pickerView == picker3.getPicker()){
            return String(years[row])
        }
            
        else{
           
            return data[row];
        }
        
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var titleData: String;
        if(pickerView == picker2.getPicker() ){
            titleData = String(month[row]);
        }
        else if (pickerView == picker3.getPicker()){
            titleData = String(years[row])
        }
   
        else{
            titleData = data[row];
        }
       
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blueColor()])
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
         var pickerLabel = view as! UILabel!
        var hue:CGFloat;
        var titleData: String;
        if(pickerView == picker2.getPicker() ){
            titleData = String(month[row]);
            //colorful
            hue = CGFloat(row)/CGFloat(month.count)
        }
        else if (pickerView == picker3.getPicker()){
            titleData = String(years[row]);
            //colorful
            hue = CGFloat(row)/CGFloat(years.count)        }
    
        else{
            titleData = data[row];
            
            //colorful
            hue = CGFloat(row)/CGFloat(data.count)
            
        }
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            
            //color  and center the label's background
            pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
            pickerLabel.textAlignment = .Center
            
        }
        
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel!.attributedText = myTitle
        
        return pickerLabel
        
    }
   
    //textfiled handle
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == picker1.getPicker()  && self.choose1!.boolValue){
            txtKy.text = data[row];
        }
        else if(pickerView == picker2.getPicker()  && self.choose1!.boolValue ){
            txtThang.text = String(month[row]);
        }
        else if(pickerView == picker3.getPicker()  && self.choose1!.boolValue ) {
            txtNam.text = String(years[row])
        }
        
        else if(pickerView == picker1.getPicker() && self.choose2!.boolValue ){
            txtKy2.text = data[row];
        }
        else if(pickerView == picker2.getPicker() && self.choose2!.boolValue ){
            txtThang2.text = String(month[row]);
        }
        else if(pickerView == picker3.getPicker() && self.choose2!.boolValue ){
            txtNam2.text = String(years[row]);
        }
        
        
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
       
        if(textField == txtKy){
            picker1.showPicker();
            picker2.hidden = true
            picker3.hidden = true
            picker1.hidden = false
            self.choose1 = true
            self.choose2 = false
        }
        else if (textField == txtThang){
            picker2.showPicker();
            picker1.hidden = true
            picker3.hidden = true
            picker2.hidden = false
            self.choose1 = true
            self.choose2 = false
        }
        else if (textField == txtNam){
            picker3.showPicker();
            picker1.hidden = true
            picker2.hidden = true
            picker3.hidden = false
            self.choose1 = true
            self.choose2 = false

        }
        else if(textField == txtKy2){
            picker1.showPicker();
            picker2.hidden = true
            picker3.hidden = true
            picker1.hidden = false
            self.choose2 = true
            self.choose1 = false
        }
        else if (textField == txtThang2){
            picker2.showPicker();
            picker1.hidden = true
            picker3.hidden = true
            picker2.hidden = false
            self.choose2 = true
            self.choose1 = false
            
        }
        else if (textField == txtNam2){
            picker3.showPicker();
            picker1.hidden = true
            picker2.hidden = true
            picker3.hidden = false
            self.choose2 = true
            self.choose1 = false
            
        }


        
        return false
    }
    
    
    //stop rotate
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int{
        return UIInterfaceOrientation.Portrait.rawValue
    }
}
