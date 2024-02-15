import  Express  from "express";
import  Cors  from "cors";
import config from "./config.js"
import productsRouter from './routes/products.routes.js'


const app = Express();

const port = config.port

app.use(Cors());
app.use(Express.json());

app.use(productsRouter);

app.get("/", (req, res) => {
    res.send("Hello World");
});

app.listen(port, () => {
    console.log(`Server is running on port: ${port}`)
})

export default app;