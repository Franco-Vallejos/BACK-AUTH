import jsonResponse from "../../lib/jsonResponse.js";
import { getConnectionCalendar, sql} from "../database/connectionSqlCalendar.js";

export const getCalendar = async (req, res) => {
    const dni = req.query.dni;
    const month = req.params.month;
    try{
        const pool = await getConnectionCalendar();
        let result;
        if(!!dni){
            result = await pool.request()
            .query("exec [api].showPersonalCalendar N'" + month + "', "+ dni +";");
        }else{
            result = await pool.request()
            .query("exec [api].showCalendar N'" + month + "' ;");
        }
        res.status(200).json(jsonResponse(200, result.recordsets[0]));
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
    const standarOriginDate = formatedOriginDate.getFullYear() + '-' + (formatedOriginDate.getMonth() + 1 )+ '-' + formatedOriginDate.getDate();
    const standarDestinationDate = formatedDestinationDate.getFullYear() + '-' + (formatedDestinationDate.getMonth() + 1) + '-' + formatedDestinationDate.getDate();

    if(!(formatedOriginDate.getDate()) || !(formatedDestinationDate.getDate())){
        return res.status(600).json(jsonResponse(600, {error: "Missing information"}));
    }

    try{
        const pool = await getConnectionCalendar();
       /* var originMonthList = await pool.request()
        .query("exec [api].showCalendar N'" + getMonth(formatedOriginDate.getMonth()) + "';");
        originMonthList = originMonthList.recordsets[0];
        var destinationMonthList;
        if(formatedOriginDate.getMonth() === formatedDestinationDate.getMonth() && formatedOriginDate.getFullYear() === formatedDestinationDate.getFullYear()){
            destinationMonthList = originMonthList;
        }
        else{
            destinationMonthList = await pool.request()
            .query("exec [api].showCalendar N'" + getMonth(formatedDestinationDate.getMonth()) + "';");
            destinationMonthList = destinationMonthList.recordsets[0];
        }

        if(!getMonthListByDni(originDni, originMonthList)[formatedOriginDate.getDate()] || !getMonthListByDni(destinationDni, destinationMonthList)[formatedDestinationDate.getDate()]){
            console.log('no concidence with dates and month list');
            return res.status(600).json(jsonResponse(600, {error: "Missing information"}));
        }

        if(getMonthListByDni(originDni, originMonthList)[formatedOriginDate.getDate()].splice(1) === 'TM'){
            if(getMonthListByDni(destinationDni, originMonthList)[formatedOriginDate.getDate()].splice(1) === 'TT' ||
            getMonthListByDni(destinationDni, originMonthList)[formatedOriginDate.getDate()-1].splice(1) === 'TT'){
                console.log('error: 24hs')
                return res.status(624).json(jsonResponse(624, {error: "24hs error"}));
            }
        }

        if(getMonthListByDni(originDni, originMonthList)[formatedOriginDate.getDate()].splice(1) === 'TT'){
            if(getMonthListByDni(destinationDni, originMonthList)[formatedOriginDate.getDate()].splice(1) === 'TM' ||
            getMonthListByDni(destinationDni, originMonthList)[formatedOriginDate.getDate()+1].splice(1) === 'TM'){
                console.log('error: 24hs')
                return res.status(624).json(jsonResponse(624, {error: "24hs error"}));
            }
        }

        if(getMonthListByDni(destinationDni, destinationMonthList)[formatedDestinationDate.getDate()].splice(1) === 'TM'){
            if(getMonthListByDni(originDni, destinationMonthList)[formatedDestinationDate.getDate()].splice(1) === 'TT' ||
            getMonthListByDni(originDni, destinationMonthList)[formatedDestinationDate.getDate()-1].splice(1) === 'TT'){
                console.log('error: 24hs')
                return res.status(624).json(jsonResponse(624, {error: "24hs error"}));
            }
        }

        if(getMonthListByDni(destinationDni, destinationMonthList)[formatedDestinationDate.getDate()].splice(1) === 'TT'){
            if(getMonthListByDni(originDni, destinationMonthList)[formatedDestinationDate.getDate()].splice(1) === 'TM' ||
            getMonthListByDni(originDni, destinationMonthList)[formatedDestinationDate.getDate()+1].splice(1) === 'TM'){
                console.log('error: 24hs')
                return res.status(624).json(jsonResponse(624, {error: "24hs error"}));
            }
        }
*/
        await pool.request()
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

export const acceptUserRequest = async(req, res) => {
    const {id} = req.body;

    if(!id){
        return res.status(600).json(jsonResponse(600, {error: "Missing information"}));
    }
    
    try{
        const pool = await getConnectionCalendar();
        const result = await pool.request()
                        .query('exec [api].updateCalendar ' + id + ';')
        pool.close();
        res.status(200).json(jsonResponse(200, {message: "update Calendar"}))
    }catch(error){
        console.log(error);
        res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB"}))
    }
}

export const rejectUserRequest = async(req, res) => {
    const {id} = req.body;

    if(!id){
        return res.status(600).json(jsonResponse(600, {error: "Missing information"}));
    }
    
    try{
        const pool = await getConnectionCalendar();
        const result = await pool.request()
                        .query('exec [api].rejectRequest ' + id + ';')
        pool.close();
        res.status(200).json(jsonResponse(200, {message: "update request"}))
    }catch(error){
        console.log(error);
        res.status(800).json(jsonResponse(800, {error: "The server has problems whit DDBB"}))
    }
}

function getMonth(month) {
    const months = ['january', 'february', 'march', 'april', 'may', 
                    'june', 'july', 'august', 'october', 'september', 'november', 'december'];
  
    return months[month];
  }

function getMonthListByDni(dni, monthList){
    return monthList.find(element => element['dni'] === dni)
}