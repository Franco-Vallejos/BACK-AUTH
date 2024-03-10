import sql from "mssql"
import config from'../config.js'

const dbSettings = {
    type: 'default',
    user: config.userCalendar,
    password: config.passwordCalendar,
    server: config.serverCalendar,
    database: config.dataBaseCalendar,
    encrypt: true,
    trustServerCertificate: true,
}

export async function getConnectionCalendar() {
    try{
        const pool = await sql.connect(dbSettings);
        return pool;
        
    }catch(error){
        console.log(error);
    }
}

getConnectionCalendar();

export {sql};