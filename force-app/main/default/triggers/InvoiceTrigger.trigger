trigger InvoiceTrigger on Invoice__c (before insert) {
    Map<String,RecordType> invRecTypeMap = new Map<String,RecordType();
    for(RecordType recType: [SELECT id, DeveloperName FROM RecordType WHERE sObjectType = 'Invoice__c']){
        invRecTypeMap.put(recType.DeveloperName,recType);
    }

    for(Invoice__c invoice: Trigger.new){
        if(invRecTypeMap.containsKey(invoice.Industry__c)){
            invoice.RecordTypeId = invRecTypeMap.get(invoice.Industry__c).Id;
        }
    }

}
/**A developer is trying to create a trigger that will set the record type of an Invoice
record, prior to insertion based on the value of the Industry picklist that is selected.
The before insert event should be used */

/**Before triggers are used to update or validate record values before they are saved to the database.
In this case, record type will be set depending on the invoice Industry picklist value prior to insertion.
Using After Insert will make the record read-only, so the record type cannot be set */