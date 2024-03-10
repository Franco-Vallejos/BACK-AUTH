import {config} from 'dotenv'
config();

export default{
    port: process.env.PORT || 5000,
    userLogin: process.env.USER_LOGIN || '',
    passwordLogin: process.env.PASSWORD_LOGIN || '',
    serverLogin: process.env.SERVER_LOGIN || '',
    dataBaseLogin: process.env.DATABASE_LOGIN || '',
    refresh_token_secret: process.env.refresh_token_secret || 'refresh_token',
    acces_token_secret: process.env.acces_token_secret || 'acces_token',
    userCalendar: process.env.USER_CALENDAR || '',
    passwordCalendar: process.env.PASSWORD_CALENDAR || '',
    serverCalendar: process.env.SERVER_CALENDAR || '',
    dataBaseCalendar: process.env.DATABASE_CALENDAR || '',
}