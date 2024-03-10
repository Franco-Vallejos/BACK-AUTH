import sql from "mssql"
import config from'../config.js'

const dbSettings = {
    type: 'default',
    user: config.userLogin,
    password: config.passwordLogin,
    server: config.serverLogin,
    database: config.dataBaseLogin,
    encrypt: true,
    trustServerCertificate: true,
}

export async function getConnectionLogin() {
    try{
        const pool = await sql.connect(dbSettings);
        return pool;
        
    }catch(error){
        console.log(error);
    }
}

getConnectionLogin();

export {sql};