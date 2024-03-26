import jsonResponse from "../../lib/jsonResponse.js";
import { getConnectionCalendar, sql} from "../database/connectionSqlCalendar.js";

export const getCalendar = async (req, res) => {
    const dni = req.query.dni;
    const month = req.params.month;
    try{
        const pool = await getConnectionCalendar();
        let result;
        console.log(dni);
        if(!!dni){
            result = await pool.request()
            .query("exec [api].showPersonalCalendar N'" + month + "', "+ dni +";");
        }else{
            result = await pool.request()
            .query("exec [api].showCalendar N'" + month + "' ;");
        }
        res.status(200).json(jsonResponse(200, result.recordsets[0]));
        console.log(result.recordsets[0])
        await pool.close();
    }catch(error){
        console.log(error);
        return res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB" , info : error}))
    }
}

export const getPersonal = async (req, res) => {
    try{
        const pool = await getConnectionCalendar();
        const result = await pool.request()
                .query('select * from [api].showPersonal;');
        res.status(200).json(jsonResponse(200, result.recordsets[0]));
        pool.close();
    }catch(error){
        console.log(error);
        return res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB" , info : error}));
    }
}

export const getUserRequest = async (req, res) => {
    const dni = req.user.username;

    if(!dni){
        return res.status(505).json(jsonResponse(505, {error: "No se recupero correctamente el username del token"}))
    }

    try{
        const pool = await getConnectionCalendar();
        const result = await pool.request()
                        .query('exec [api].showUserRequest ' + dni + ';');
        pool.close();
        return res.status(200).json(jsonResponse(200, result.recordsets[0]))
    }catch(error){
        console.log(error);
        return res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB" , info : error}));
    }

}

export const createNewProduct = async (req, res) => {
    const {dia, tm, tt} = req.body;

    if(dia == null){
        return res.status(400).json('Bad request. Please, specify the day');
    }
    try{
        const pool = await getConnectionCalendar();

        await pool.request()
            .input("dia", sql.Int, dia)
            .input("TM", sql.VarChar, tm)
            .input("TT", sql.VarChar, tt)
            .query("INSERT INTO monthTurn (dia, tt, tm) VALUES (@dia, @tt, @tm)");

        await pool.close();
        }catch(error){
            res.status(500);
            res.send(error.message);
            return;         
        }
        res.json('productoos');
}

export const addUserRequest = async (req, res) => {
    const {originDni, originDate, destinationDni, destinationDate} = req.body;
    if (!originDni || !originDate  || !destinationDni || !destinationDate ){
        return res.status(600).json(jsonResponse(600, {error: "Missing information"}));
    }
    const formatedOriginDate = new Date(originDate);
    const formatedDestinationDate = new Date(destinationDate);

    if(!(formatedOriginDate.getDate()) || !(formatedDestinationDate.getDate())){

        return res.status(600).json(jsonResponse(600, {error: "Missing information"}));
    }

    const standarOriginDate = formatedOriginDate.getFullYear() + '-' + (formatedOriginDate.getMonth() + 1 )+ '-' + formatedOriginDate.getDate();
    const standarDestinationDate = formatedDestinationDate.getFullYear() + '-' + (formatedDestinationDate.getMonth() + 1) + '-' + formatedDestinationDate.getDate();
    console.log('exec [api].insertOnRequest ' + originDni + ", '" + standarOriginDate + "', "
    + destinationDni + ", '" + standarDestinationDate + "';")
    try{
        const pool = await getConnectionCalendar();
        const result = await pool.request()
                    .query('exec [api].insertOnRequest ' + originDni + ", '" + standarOriginDate + "',  "
                    + destinationDni + ", '" + standarDestinationDate + "';");
        pool.close();
        res.status(200).json(jsonResponse(200, {message: "Added request"}));
    }catch(error){
        console.log(error);
        res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB"}))
    }

}

export const deleteUserRequest = async(req, res) => {
    const {id} = req.body;

    if(!id){
        return res.status(600).json(jsonResponse(600, {error: "Missing information"}));
    }

    try{
        const pool = await getConnectionCalendar();
        const result = await pool.request()
                        .query('exec [api].deleteOnRequest ' + id + ';')
        pool.close();
        res.status(200).json(jsonResponse(200, {message: "elimited Request"}))
    }catch(error){
        console.log(error);
        res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB"}))
    }
}

