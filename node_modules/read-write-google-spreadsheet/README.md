## Read and Write Google Spreadsheet

> A simple API for reading and writing Google Spreadsheets in Node.js
 
#### install
```
 npm install read-write-google-spreadsheet
```

#### Basic Usage
 *Note: Using the options `spreadsheetName` and `worksheetName` will cause lookups for `spreadsheetId` and `worksheetId`. Use `spreadsheetId` and `worksheetId` for improved performance.*
 
```
var Spreadsheet = required('read-write-google-spreadsheet');
var opts = {
  debug: true,
  spreadsheetId: '*************************************',
  worksheetId: '******',
  //spreadsheetName: '***********',
  //worksheetName: '******',
  oauth2: {
    client_id: '*************************',
    client_secret: '*********',
    refresh_token: '*********'
  }
};
var spreadsheet = new Spreadsheet(opts);

spreadsheet.getHeader(function(err, result) {
  // -- get work sheet header 
});

```
#### API
 
##### `spreadsheet.getHeader(callback)`
 Used to get the header from workSheet
 
##### `spreadsheet.getAllRows(callback)`
 Used to read workSheet  and construct array of json  callback() retrun array of json
 
##### `spreadsheet.getRowsByConstraints(properties, callback)`
  
  ```
   var property = {'colum1Header':'value' , column2Headre : 'value'}
  ```
  Used to read worksheet and filter by  Constraints
 
  Looks through each value in the rows, returning an array of all the values that contain all of the key-value     pairs listed in properties 
  
##### `spreadsheet.addNewRow(params, callback)`
   ```
   var params = {'colum1Header':'value' , column2Header : 'value'}
  ```
  This will be called when adding a new row into the worksheet
  
##### `spreadsheet.updateRow(params, callback)`
   ```
   var params = {'colum1Header':'value' , column2Header : 'value', row = 'row Number'}
  ```
  This will be called when modifying an existing row in the worksheet
  
   **Note: Attribute 'row' is mandatory**
  
#### References

* https://developers.google.com/google-apps/spreadsheets/
* https://github.com/jpillora/node-edit-google-spreadsheet
