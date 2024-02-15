import sql from "mssql"
import config from'../config.js'

const dbSettings = {
    type: 'default',
    user: config.user,
    password: config.password,
    server: config.server,
    database: config.database,
    encrypt: true,
    trustServerCertificate: true,
}

export async function getConnection() {
    try{
        const pool = await sql.connect(dbSettings);
        return pool;
        
    }catch(error){
        console.log(error);
    }
}

getConnection();

export {sql};