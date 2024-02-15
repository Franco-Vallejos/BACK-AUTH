import { Router } from "express"
import { getLogin, getRefreshToken, getSignout, getTodos, getUser } from "../controllers/products.controller.js";

const router = Router();

router.get('/api/login', getLogin);

router.get('/api/refreshToken', getRefreshToken)

router.get('/api/signout', getSignout);

router.get('/api/todos', getTodos);

router.get('/api/user', getUser);


export default router;


