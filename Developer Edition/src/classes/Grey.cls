public class Grey { 
    public Grey(ApexPages.StandardController controller) {
        disab = true;
    }
Public Boolean disab{get;set;}

Public pagereference dodisable(){
            disab = false;    
            return null;
    }

}