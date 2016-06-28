
import UIKit

class Song
{
    let titel: String;
    let artiest: String;
    var status: String;
    
    let nextColor = UIColor.blueColor()
    let nowColor = UIColor.greenColor()
    let previousColor = UIColor.redColor()
    
    init(titel: String, artiest: String)
    {
        self.titel = titel
        self.artiest = artiest
        self.status = "Prev"
    }
    
    func setStatus(status: String)
    {
        self.status = status;
    }
    
    func getStatusColor() -> UIColor
    {
        switch(status)
        {
            case("Next"):
                return nextColor;
            
            case("Now"):
                return nowColor
            
            case("Prev"):
                return previousColor
            
            default:
                return previousColor
        }
    }
    
}
