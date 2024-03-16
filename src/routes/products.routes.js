import { Router } from "express"
import { getLogin, getRefreshToken, logOut, getTodos, getUser } from "../controllers/products.controller.login.js";
import {getCalendar, getPersonal, getUserRequest} from '../controllers/products.controller.calendar.js'
import authenticateToken from "../auth/authenticatedToken.js";

const router = Router();

router.post('/api/login', getLogin);

router.post('/api/refreshToken', getRefreshToken)

router.delete('/api/logout', logOut);

router.get('/api/todos', getTodos);

router.get('/api/user', authenticateToken, getUser);

router.get('/api/query/calendar/:month', authenticateToken, getCalendar);

router.get('/api/query/personal/all', authenticateToken, getPersonal);

router.get('/api/query/request/user', authenticateToken, getUserRequest);

export default router;


