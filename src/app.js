import  Express  from "express";
import  cors  from "cors";
import config from "./config.js"
import productsRouter from './routes/products.routes.js'


const app = Express();
const port = config.port
app.use(Express.json());
app.use(cors());
app.use(productsRouter);
app.use(Express.urlencoded({extended : false}));


app.get("/", (req, res) => {
    res.send("Hello World");
});

app.listen(port, () => {
    console.log(`Server is running on port: ${port}`)
})

export default app;