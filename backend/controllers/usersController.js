const User = require("../models/user");

module.exports = {
  async getAll(req, res, next) {
    try {
      const data = await User.getAll();
      console.log(`Users: ${data}`);
      res
        .status(200)
        .json({
          success: true,
          message: "User created successfully",
          data: user.id,
        });
    } catch (err) {
      console.log(`Error: ${err}`);
      res.status(501).json({
        success: false,
        message: "There was an error getting the users",
        err,
      });
    }
  },
  async create(req, res, next) {
    try {
      const user = await User.create(req.body);
      console.log(`User created: ${user}`);
      res.status(200).json({
        success: true,
        message: "User created successfully",
        data: user.id,
      });
    } catch (err) {
      console.log(`Error: ${err}`);
      res.status(501).json({
        success: false,
        message: "There was an error creating the user",
        err,
      });
    }
  },
};
