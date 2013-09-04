/* ************************************************************************************
* Apex Class: StrikeIron_Custom
* Created: Michael Smith/Force2b LLC, 07/10/2012
* http://www.force2b.net, mike.smith@force2b.net
*
* Purpose(s):
* - Controller for the StrikeIronTest Visualforce page.
*
* Unit Test: StrikeIron_Custom_Tests
*
* Modifications: 
* 
*************************************************************************************** */
public class StrikeIron_Custom {

    // pull the username/password from a custom settings object
    private static final string un = StrikeIron_Settings__c.getOrgDefaults().Username__c;
    private static final string pw = StrikeIron_Settings__c.getOrgDefaults().Password__c;

    // ---------------------------------------------------------------------------
    // Controller for the StrikeIron_Test VisualForce page
    // ---------------------------------------------------------------------------
    public StrikeIron_Custom() { 
        this.username = un;
        this.password = pw;
    }
    public string zipcode   { get; set; }

    public string username   { get; set; }
    public string password   { get; set; }
    
    public double taxrate   { get; private set; }
    public double stateTax  { get; private set; }
    public string city      { get; private set; }
    public string state     { get; private set; }
    public string county    { get; private set; }
    public string shippingTax { get; private set; }
    public string statistics { get; private set; }
    public pageReference getRate() {
        Strikeiron_TaxBasic.GetTaxRateUSResponse_element rtn;
        Strikeiron_TaxBasic.TaxDataBasicSoap proxy = new Strikeiron_TaxBasic.TaxDataBasicSoap();
        
        try {        
            rtn = proxy.GetTaxRateUS(this.username, this.username, this.password, zipcode);
            taxrate = rtn.GetTaxRateUSResult.ServiceResult.TotalSalesTax;
            city = rtn.GetTaxRateUSResult.ServiceResult.City;
            state = rtn.GetTaxRateUSResult.ServiceResult.State;
            county = rtn.GetTaxRateUSResult.ServiceResult.County;
            shippingTax = 'Alone:' + rtn.GetTaxRateUSResult.ServiceResult.TaxShippingAlone
                + '/+Handling:' + rtn.GetTaxRateUSResult.ServiceResult.TaxShippingHandling;
            stateTax = rtn.GetTaxRateUSResult.ServiceResult.StateSalesTax;
            statistics = 'License Status: ' + rtn.SISubscriptionInfo.LicenseStatus + '<br/>'
            + 'License Action: ' + rtn.SISubscriptionInfo.LicenseAction + '<br/>'
            + 'Remaining Hits: ' + rtn.SISubscriptionInfo.RemainingHits + '<br/>'
            + 'Status Result: ' + rtn.GetTaxRateUSResult.ServiceStatus.StatusDescription;
            
        } catch (exception ex) {
            city = state = county = null;
            taxrate = null;
            statistics = ex.getMessage();
        }

        if (this.username != un || this.password != pw) {
            StrikeIron_Settings__c si = new StrikeIron_Settings__c();
            if (un != null) si = [SELECT ID, Username__c, Password__c 
            FROM StrikeIron_Settings__c LIMIT 1];
            si.Username__c = this.username;
            si.Password__c = this.password;
            upsert(si);
        }
        
        return null;
    }       
    
}