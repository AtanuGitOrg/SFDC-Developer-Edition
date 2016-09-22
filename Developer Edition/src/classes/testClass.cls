public with sharing class testClass
{
    //region class members]
    string myName = '';
    
    //end


    public testClass() //Class constructor initializing the class
    {
    
    }
    
    //Properties
    public string getMyName()
    {
        return myName;
    }
    
    public void setMyName()
    {
    
    }
    
    
    //Behaviour via Method
    public string showMyName()
    {
        myName = 'Raju';
        return myName;
    }

}