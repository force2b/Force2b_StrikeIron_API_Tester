/* ************************************************************************************
* Apex Class: StrikeIron_Custom_Tests
* Created: Michael Smith/Force2b LLC, 07/10/2012
* http://www.force2b.net, mike.smith@force2b.net
*
* Purpose(s):
* - Unit Tests for the StrikeIron_Custom Controller and the primary StrikeIron WSDL Classes
* - Note: Using SeeAllData=TRUE to allow this to read the configuration username/passwords 
*
* Modifications: 
* 
*************************************************************************************** */
@isTest(SeeAllData=True)
private class StrikeIron_Custom_Tests {

    // ==================================================================================
    // General Constructor Unit Test
    // ==================================================================================
    private static testMethod void test_strikeiron_custom() {
        StrikeIron_Custom ctrlr = new StrikeIron_Custom();
        ctrlr.zipcode = '08534';
        try {
            ctrlr.getRate();
        } catch (exception ex) { }
    }
   
    // ==================================================================================
    // Unit Test for the Strikeiron_TaxBasic class as imported from the WSDL
    // ==================================================================================
    private static testMethod void test_strikeiron() {
 
        // pull the username/password from a custom settings object
        string un = StrikeIron_Settings__c.getOrgDefaults().Username__c;
        string pw = StrikeIron_Settings__c.getOrgDefaults().Password__c;
 
        Strikeiron_TaxBasic.ArrayOfMethodStatusRecord b = new Strikeiron_TaxBasic.ArrayOfMethodStatusRecord();
        Strikeiron_TaxBasic.ArrayOfServiceInfoRecord c = new Strikeiron_TaxBasic.ArrayOfServiceInfoRecord();
        Strikeiron_TaxBasic.ArrayOfSIWsStatus d = new Strikeiron_TaxBasic.ArrayOfSIWsStatus();
        Strikeiron_TaxBasic.GetServiceInfo_element e = new Strikeiron_TaxBasic.GetServiceInfo_element();
        Strikeiron_TaxBasic.GetServiceInfoResponse_element f = new Strikeiron_TaxBasic.GetServiceInfoResponse_element();
        Strikeiron_TaxBasic.GetStatusCodesForMethod_element g = new Strikeiron_TaxBasic.GetStatusCodesForMethod_element();
        Strikeiron_TaxBasic.GetStatusCodesForMethodResponse_element a = new Strikeiron_TaxBasic.GetStatusCodesForMethodResponse_element();
        Strikeiron_TaxBasic.GetTaxRateCanada_element h = new Strikeiron_TaxBasic.GetTaxRateCanada_element();
        Strikeiron_TaxBasic.GetTaxRateUS_element i = new Strikeiron_TaxBasic.GetTaxRateUS_element();
        Strikeiron_TaxBasic.GetTaxRateUSResponse_element j = new Strikeiron_TaxBasic.GetTaxRateUSResponse_element();
        Strikeiron_TaxBasic.GetTaxRateCanadaResponse_element k = new Strikeiron_TaxBasic.GetTaxRateCanadaResponse_element();
        Strikeiron_TaxBasic.MethodStatusRecord l = new Strikeiron_TaxBasic.MethodStatusRecord();
        Strikeiron_TaxBasic.ServiceInfoRecord m = new Strikeiron_TaxBasic.ServiceInfoRecord();
        Strikeiron_TaxBasic.SILicenseInfo n = new Strikeiron_TaxBasic.SILicenseInfo();
        Strikeiron_TaxBasic.SISubscriptionInfo o = new Strikeiron_TaxBasic.SISubscriptionInfo();
        Strikeiron_TaxBasic.SIWsOutputOfMethodStatusRecord p = new Strikeiron_TaxBasic.SIWsOutputOfMethodStatusRecord();
        Strikeiron_TaxBasic.SIWsOutputOfSIWsResultArrayOfMethodStatusRecord q = new Strikeiron_TaxBasic.SIWsOutputOfSIWsResultArrayOfMethodStatusRecord();
        Strikeiron_TaxBasic.SIWsOutputOfSIWsResultArrayOfServiceInfoRecord r = new Strikeiron_TaxBasic.SIWsOutputOfSIWsResultArrayOfServiceInfoRecord();
        Strikeiron_TaxBasic.SIWsOutputOfTaxRateCanadaData s = new Strikeiron_TaxBasic.SIWsOutputOfTaxRateCanadaData();
        Strikeiron_TaxBasic.SIWsOutputOfTaxRateUSAData t = new Strikeiron_TaxBasic.SIWsOutputOfTaxRateUSAData();
        Strikeiron_TaxBasic.SIWsResultArrayOfMethodStatusRecord u = new Strikeiron_TaxBasic.SIWsResultArrayOfMethodStatusRecord();
        Strikeiron_TaxBasic.SIWsResultArrayOfServiceInfoRecord v = new Strikeiron_TaxBasic.SIWsResultArrayOfServiceInfoRecord();        
        Strikeiron_TaxBasic.SIWsStatus w = new Strikeiron_TaxBasic.SIWsStatus();
        Strikeiron_TaxBasic.TaxRateCanadaData x = new Strikeiron_TaxBasic.TaxRateCanadaData();
        Strikeiron_TaxBasic.TaxRateUSAData y = new Strikeiron_TaxBasic.TaxRateUSAData();
        Strikeiron_TaxBasic.GetStatusCodes_element a1  = new Strikeiron_TaxBasic.GetStatusCodes_element();
        Strikeiron_TaxBasic.GetStatusCodesResponse_element a2 = new Strikeiron_TaxBasic.GetStatusCodesResponse_element();
        Strikeiron_TaxBasic.SIWsResultArrayOfSIWsStatus a3 = new Strikeiron_TaxBasic.SIWsResultArrayOfSIWsStatus();
        
        Strikeiron_TaxBasic.TaxDataBasicSoap proxy = new Strikeiron_TaxBasic.TaxDataBasicSoap();
        try {
            proxy.GetTaxRateUS(un, un, pw, '08534');
        } catch (exception ex) { }
        try {
            proxy.GetServiceInfo(un, un, pw);
        } catch (exception ex) { }
        try {
            proxy.GetStatusCodes(un, un, pw);
        } catch (exception ex) { }
        try {
            proxy.GetStatusCodesForMethod(un, un, pw, null);
        } catch (exception ex) { }
        try {
            proxy.GetTaxRateCanada(un, un, pw, null);
        } catch (exception ex) { }
    
    }	

}