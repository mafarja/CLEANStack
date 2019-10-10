var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var Task = new Schema({
  description: String,
  status: String,
  posted: {
  	type: Date,
  	default: Date.now
  },
  list_id: {
  	type: mongoose.Schema.Types.ObjectId,
  	ref: 'List'
  },
  date_modified: {
  	type: Date
  }
});

mongoose.model('Task', Task);