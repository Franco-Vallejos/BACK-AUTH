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