const mongoose = require("mongoose");
const express = require("express");
const authRouter = require("./routes/auth");

// const PORT = process.env.PORT || 3000;
const PORT = 3000;
const app = express();

app.use(express.json());
app.use(authRouter);
const DB =
  "mongodb+srv://harsh:test123@e-commerce.yvgrz.mongodb.net/?retryWrites=true&w=majority&appName=E-commerce";
mongoose
  .connect(DB)
  .then(() => {
    console.log("db connected successfully");
  })
  .catch((err) => {
    console.log(err);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`server conneted to port :${PORT}`);
});
