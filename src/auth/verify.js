import jwt from "jsonwebtoken";
import config from "../config.js";

export function verifyAccessToken(token){
    return jwt.verify(token, config.acces_token_secret)
}

export function verifyRefreshToken(token){
    return jwt.verify(token, config.refresh_token_secret)
}