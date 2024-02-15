import { jsonResponse } from "../../lib/jsonResponse.js";


export const getLogin = async (req, res) => {
    res.send("login");
    return;
}

export const getRefreshToken = async (req, res) => {
    res.send("refreshToken");
    return;
}

export const getSignout = async (req, res) => {
    const {username, name, password} = req.body
    if(!! username || !!name || !!password){
        return res.status(400).json(
            jsonResponse(400, {
                error: "Fields are requiered",
            })
        )
    }
    res.send("signout");
    return;
}

export const getTodos = async (req, res) => {
    res.send("todos");
    return;
}

export const getUser = async (req, res) => {
    res.send("user");
    return;
}