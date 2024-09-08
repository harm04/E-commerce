const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  firstname: { required: true, trim: true, type: String },
  lastname: { required: true, trim: true, type: String },
  email: {
    required: true,
    trim: true,
    type: String,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return value.match(re);
      },
      message: "Please enter a valid email",
    },
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  
  password:{
    required:true,
    type:String,    
  }
});

const User=mongoose.model("User",userSchema);

module.exports = User;
