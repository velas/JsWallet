var Spreadsheet = require('edit-google-spreadsheet');
var _ = require('underscore');
var async = require('async');

/*
 * This method used to construct the array of json  Objeects 
 * Ex. Header cells will be keys and corresponding column cell will be values
 */

function _constructJsonObj(keys, values) {
  var jsonDatas = [];
  if (values) {
    _.each(values, function(value, key) {
      var obj = {};
      _.mapObject(keys, function(val, key) {
        obj[val.toString()] = _.propertyOf(value)(key) || '';
      });
      obj.row = key
      jsonDatas.push(obj);
    })
  }
  return jsonDatas;
}

/*
 * This method used to construct spreadsheet object
 * We might have the constructed object according to our needs(JSON) now which will be roll backed
 * as Original spreadsheet object
 * 
 * @params(spreadsheet header, input userObject)
 * @return{ row : {
              column1 : value,
              column2 : value,
              column3 : value,
              column4 : value,
              column5 : value,
           } }
 */
function _constructSpreadSheetObj(rows, params) {
  var obj = {};

  var rowHeader = _.chain(rows)
    .pick(rows, 1)
    .values(rows)
    .value()[0];

  _.mapObject(rowHeader, function(val, key) {
    if (params[val]) {
      obj[key] = params[val];
    }
  });

  return obj;
}

/*
 * This method used to get header object alone
 */
function _getHeaderRow(rows) {
  //get first row(header) using _pick
  var fields = _.chain(rows)
    .pick(rows, 1)
    .values(rows)
    .value()[0];
  fields = _.values(fields);
  return fields;
}

var MySpreadsheet = function(opts) {
  this.opts = opts;
}


/*
 * Initate the Spreadsheet
 */
MySpreadsheet.prototype.init = function(callback) {
  Spreadsheet.load(this.opts, callback);
};

/*
 * This helps to get the appropriate sheet based on the authentication
 */
MySpreadsheet.prototype.sheetReady = function(callback) {
  this.init(callback)
};

/*
 * This helps to retrieve the spread sheet informations
 */
MySpreadsheet.prototype.sheetReceive = function(callback) {
  this.sheetReady(function(err, spreadsheet) {
    if (err) throw err;
    spreadsheet.receive(callback);
  })
};

/*
 *This method used to find the header from workSheet
 */
MySpreadsheet.prototype.getHeader = function(callback) {
  this.sheetReceive(function(err, rows, info) {
    callback(err, _getHeaderRow(rows))
  });
};


/*
 * This Method used to read workSheet  
 * and construct array of json
 * callback() retrun array of json
 */
MySpreadsheet.prototype.getAllRows = function(callback) {
  this.sheetReceive(function(err, rows, info) {
    if (err) throw err;
    var keys = _.chain(rows)
      .pick(rows, 1)
      .values(rows)
      .value()[0];

    var values = _.omit(rows, 1); //remove first row(header) using _omit

    callback(null, _constructJsonObj(keys, values));
  });

};

/*
 * This Method used to read worksheet and filter by  Constraints
 * Looks through each value in the rows, returning an array of all the values that contain all of the key-value pairs listed in properties.
 */
MySpreadsheet.prototype.getRowsByConstraints = function(properties, callback) {
  if (properties) {
    this.getAllRows(function(err, result) {
      callback(null, _.where(result, properties));
    });
  } else {
    callback(null, "No result found");
  }
};

/*
 * This Method used to read worksheet and filter by  value
 * Looks through the rows and returns the first value that matches all of the key-value pairs listed in properties
 */

MySpreadsheet.prototype.getRowByValue = function(property, callback) {
 if (property) {
   this.getAllRows(function(err, result) {
     callback(err, _.findWhere(result, property));
   });
  } else {
    callback(null, "No result found");
  }
 
}

/**
 * This used to insert or update a row in worksheet
 **/
MySpreadsheet.prototype.insertOrUpdate = function(params, callback) {
  this.sheetReady(function(err, spreadsheet) {
    spreadsheet.add(params);
    spreadsheet.send(function(err, result) {
      callback(err, "Spreadsheet updated successfully");
    });
  });
};

/**
 * This will be called when adding a new row into the worksheet
 **/
MySpreadsheet.prototype.addNewRow = function(params, callback) {
  var _self = this;
  this.sheetReceive(function(err, rows, info) {
    if (err) throw err;
    var row = {};
    row[info.nextRow] = _constructSpreadSheetObj(rows, params);
    _self.insertOrUpdate(row, callback)
  })
};

/**
 * This will be called when modifying an existing row in the worksheet
 **/
MySpreadsheet.prototype.updateRow = function(params, callback) {
  var _self = this;
  if (params.row) {
    async.waterfall([
      function(callback) {
        _self.getRowByValue({
          row: params.row
        }, callback);
      },
      function(result, callback) {
        if (result) {
          var rs = _.extend(result, params);
          _self.sheetReceive(function(err, rows, info) {
            var row = {};
            row[rs.row] = _constructSpreadSheetObj(rows, rs);
            _self.insertOrUpdate(row, callback)
          });
        } else {
          callback('Invalid row', params);
        }
      },
    ], callback);
  } else {
    callback("There is no 'row' attribute in given input", params);
  }
};

module.exports = MySpreadsheet;
