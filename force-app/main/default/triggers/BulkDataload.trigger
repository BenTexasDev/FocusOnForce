trigger BulkDataload on SOBJECT (before insert) {
    /**The following code snippet fails during bulk data load. why? */
    for(Contact con: Trigger.new){
        if(con.PostalCode != null){
            List<State__c> stateList = [SELECT Id, Postal__c FROM State__c WHERE Postal__c =: con.PostalCode];
            if(stateList.size()>0){
                con.State__c = stateList[0].Id;
            }
        }
    }
}
/** SOQL query is located inside the for loop code. */

/**There is a govenor limit that enforces a maximum number of SOQL queries.
To deal with this, move any database operations outside of for loops. If you
need to query, query once, retrieve all the necessary data in a single query, then
iterate over the results */