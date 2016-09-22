/****************************************************************************************************
Created By        : Amit Rajan
Date              : 14 October 2013
Project           : Retire Ready Solution
Release           : 1
Version           : 1.0
Description       : Supports the Clone relationship trigger on account.
Change Log        : -----------------------------------------------------------------------------
                    Developer                   Date                    Description
                    ----------------------------------------------------------------------------                 
                    Amit Rajan                  14-Oct-2013             Original Version
                    Amit Rajan                  30-Oct-2013             Updated with new method for RR-2696
******************************************************************************************************/

public class rr_AddressSync {
/*
     public static void AddressSync (list<rr_Address__c> rrAddressList){
        list<Id> accountIdList = new list<Id>();
        map<Id, list<rr_Address__c>> accountAddressMap = new map<Id, list<rr_Address__c>> ();
        for (rr_Address__c thisAddress: rrAddressList){
            accountIdList.add(thisAddress.rr_Customer__c);
            if(accountAddressMap.containsKey(thisAddress.rr_Customer__c))
                accountAddressMap.get(thisAddress.rr_Customer__c).add(thisAddress);
            else                
                accountAddressMap.put(thisAddress.rr_Customer__c, new List <rr_Address__c> {thisAddress});  
        }
        
        list<Account> accountList = [select Id, Name, BillingStreet,BillingCity,BillingState,BillingCountry,BillingPostalCode, ShippingStreet,ShippingCity,ShippingState,ShippingPostalCode,ShippingCountry From Account Where Id IN:accountIdList];
        list<Account> accountListToUpdate = new list<Account>();
        for(Account thisAccount : accountList){
            list<rr_Address__c> thisAddressList = accountAddressMap.get(thisAccount.Id);
            
            for(rr_Address__c thisAddress : thisAddressList){
                if(thisAddress.rr_Address_Type__c == 'A'){
                    thisAccount.BillingStreet = thisAddress.rr_Street_Mapping__c;
                    thisAccount.BillingCity = thisAddress.rr_Town_City__c;
                    thisAccount.BillingState = thisAddress.rr_County__c;                    
                    thisAccount.BillingPostalCode = thisAddress.rr_Postcode__c;
                    thisAccount.BillingCountry = thisAddress.rr_Country__c;
                    accountListToUpdate.add(thisAccount);
                }
                else if (thisAddress.rr_Address_Type__c == 'P'){
                    thisAccount.ShippingStreet = thisAddress.rr_Street_Mapping__c;
                    thisAccount.ShippingCity = thisAddress.rr_Town_City__c ;
                    thisAccount.ShippingState = thisAddress.rr_County__c ;
                    thisAccount.ShippingPostalCode = thisAddress.rr_Postcode__c ;
                    thisAccount.ShippingCountry = thisAddress.rr_Country__c ;
                    accountListToUpdate.add(thisAccount);
                }               
            }
        }
        if(accountListToUpdate.size()>0)
            update accountListToUpdate;
    }
    
    public static list<rr_Address__c> AddressTypeSync (list<rr_Address__c> rrAddressList){
        
        list<rr_Address__c> addressToUpdate = new list<rr_Address__c>();
        for(rr_Address__c thisAddress: rrAddressList){
            
            if(thisAddress.rr_Address_Type__c == null && thisAddress.rr_Address_TypeDisplay__c != null) 
                thisAddress.rr_Address_Type__c =thisAddress.rr_Address_TypeDisplay__c.substring(0,1);
                
            else if((thisAddress.rr_Address_Type__c != null)&&(thisAddress.rr_Address_TypeDisplay__c  != thisAddress.rr_Address_Type__c)){
                if(thisAddress.rr_Address_Type__c == 'A')
                    thisAddress.rr_Address_TypeDisplay__c  =  'Actual Address'; 
                if(thisAddress.rr_Address_Type__c == 'P')
                    thisAddress.rr_Address_TypeDisplay__c  =  'Postal Address';
                if(thisAddress.rr_Address_Type__c == 'F')
                    thisAddress.rr_Address_TypeDisplay__c  =  'Forwarding Address'; 
                if(thisAddress.rr_Address_Type__c == 'D')
                    thisAddress.rr_Address_TypeDisplay__c  =  'Document Exchange Address';              
            }   
            else if((thisAddress.rr_Address_TypeDisplay__c != null)&&(thisAddress.rr_Address_TypeDisplay__c  != thisAddress.rr_Address_Type__c)){
                if(thisAddress.rr_Address_TypeDisplay__c == 'Actual Address')
                    thisAddress.rr_Address_Type__c  =  'A'; 
                if(thisAddress.rr_Address_TypeDisplay__c == 'Postal Address')
                    thisAddress.rr_Address_Type__c  =  'P';
                if(thisAddress.rr_Address_TypeDisplay__c == 'Forwarding Address')
                    thisAddress.rr_Address_Type__c  =  'F'; 
                if(thisAddress.rr_Address_TypeDisplay__c == 'Document Exchange Address')
                    thisAddress.rr_Address_Type__c  =  'D';             
            }   
            addressToUpdate.add(thisAddress);       
        }
        return addressToUpdate;
    }
*/
}