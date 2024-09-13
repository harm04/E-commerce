const mongoose = require("mongoose");
const express = require("express");
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// const PORT = process.env.PORT || 3000;
const PORT = process.env.PORT || 3000;
const app = express();

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
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
