import { verifyAccessToken } from "./verify.js";
import validateToken from "./validateToken.js";

function authenticateToken(req, res, next) {
    let token = null;
    try {
      token = validateToken(req.headers);
      //    log.info("Token", token);
    } catch (error) {
      //console.log("Error", error.message);
      log.error(error.message);
      if (error.message === "Token not provided") {
        return res.status(401).json({ error: "Token no proporcionado" });
      }
      if (error.message === "Token format invalid") {
        return res.status(401).json({ error: "Token mal formado" });
      }
    }
  
    try {
      const decoded = verifyAccessToken(token);
      req.user = decoded.user;
      console.log("Este es el user :")
      console.log(req.user)
      next();
    } catch (err) {
      console.log("6 Token inválido", token, err);
      return res.status(403).json({ error: "Token inválido" });
    }
  }

  export default authenticateToken;