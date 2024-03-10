import jwt from "jsonwebtoken";
import config from "../config.js";

function sing(payload, isAccessToken){
    console.log(payload)
    return jwt.sign(payload, isAccessToken ? config.acces_token_secret : config.refresh_token_secret, 
                    {
                        algorithm : "HS256",
                        expiresIn: 3600
                    });
}

export function generateAccessToken(user){
    return sing({user},  true);
}

export function generateRefreshToken(user){
    return sing({user},  false);
}

