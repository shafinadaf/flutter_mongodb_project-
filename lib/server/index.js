console.log("hello, world");
const mongoose = require("mongoose");
const express = require("express");
const authRouter = require("./routes/auth");
const app = express();
var cors = require("cors");

const PORT = process.env.PORT || 3000;

mongoose.set("strictQuery", false);
const DB =
  "mongodb+srv://shafi:Al8AeRioS5jTnRYd@cluster0.r0jnuxj.mongodb.net/?retryWrites=true&w=majority";
  var cors = require("cors");

app.use(cors()); 
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
