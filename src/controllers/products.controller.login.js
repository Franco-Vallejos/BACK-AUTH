import jsonResponse from "../../lib/jsonResponse.js";
import { generateAccessToken, generateRefreshToken } from "../auth/generateTokens.js";
import{getConnectionLogin} from '../database/connectionUserDataBase.js'
import {verifyAccessToken, verifyRefreshToken} from '../auth/verify.js'
import validateToken from "../auth/validateToken.js";

function createAccessToken(user){
    return generateAccessToken(user);
}

async function refreshAccessToken(user){
    const refresh_token = generateRefreshToken(user);
    try{
        const pool = await getConnectionLogin();
        await pool.request().query("exec [api].setToken " + user.username + ", '" + refresh_token + "' ;");
        pool.close();
    }catch(error){
        console.log(error);
        return -1;
    }
    return refresh_token;
}


export const getLogin = async (req, res) => {
    const {userName, password} = req.body
    let userData;
    if(!!! userName || !!!password){
        return res.status(400).json(jsonResponse(400, {error : "Fields are requiered"}))        
    }
    try{
        const pool = await getConnectionLogin();
        const result = await pool.request()
            .query("exec [api].getUserData N'" + userName + "';")
        userData = result.recordset[0];
        pool.close();
        if(!userData || userData.password != password){
            return res.status(400).json(jsonResponse(450, {error : "Incorrect username or password"}));
        }
        
    }catch(error){
        console.log(error)
        return res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB" , info : error}))
    }
    const accessToken = createAccessToken(userData);
    const refreshToken = await refreshAccessToken(userData);
    res.status(200).json(jsonResponse(200, {userName, accessToken, refreshToken}))
    return;
}


export const getRefreshToken = async (req, res) => {
    const refreshToken = req.body.refreshToken;
    if (!refreshToken) {
    console.log("No se proporcionó token de actualización", refreshToken);
    return res
        .status(401)
        .json({ error: "Token de actualización no proporcionado" });
    }

    try {
        const pool = await getConnectionLogin()
        const tokenDocument = await pool.request().query("exec [api].getUserFromToken N'" +  refreshToken + "'")
        if (!tokenDocument.recordset[0]) {
            return res.status(403).json({ error: "Token de actualización inválido" });
        }
        
        const payload = verifyRefreshToken(tokenDocument.recordset[0].token);
        
        const result = await pool.request()
        .query("exec [api].getUserData N'" + tokenDocument.recordset[0].username + "';")
        try{
            await pool.close()
        }catch(error){console.log(error)}
        const userData = result.recordset[0];
        const accessToken = createAccessToken(userData);
        res.json(jsonResponse(200, { accessToken }));
    } catch (error) {
        console.log(error)
        return res.status(403).json({ error: "Token de actualización inválido" });
    }
}

export const logOut = async (req, res, next) => {
    try {
        const refreshToken = validateToken(req.headers);
    
        const pool = await getConnectionLogin();
        pool.request().query("exec [api].removeToken N'" + refreshToken +"';").then(
        res.json({
          success: "Token removed",
        }))
      } catch (error) {
        return next(new Error("Error loging out the user " + error.message));
    }
}

export const getTodos = async (req, res) => {
    res.send("todos");
    return;
}

export const getUser = async (req, res, next) => {
    res.json(jsonResponse(200, req.user));
}