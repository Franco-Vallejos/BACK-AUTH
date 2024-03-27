import { Router } from "express"
import { getLogin, getRefreshToken, logOut, getTodos, getUser } from "../controllers/products.controller.login.js";
import {getCalendar, getPersonal, getUserRequest, addUserRequest,
         deleteUserRequest, acceptUserRequest, rejectUserRequest} from '../controllers/products.controller.calendar.js'
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

router.post('/api/query/request/add', authenticateToken, addUserRequest);

router.post('/api/query/request/delete', authenticateToken, deleteUserRequest);

router.post('/api/query/request/update-calendar', authenticateToken, acceptUserRequest);

router.post('/api/query/request/reject-request', authenticateToken, rejectUserRequest);

export default router;


