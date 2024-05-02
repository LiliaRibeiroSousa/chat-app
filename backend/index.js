import express, { json } from "express";
import cors from "cors";
import axios from "axios";

const app = express();
app.use(json());
app.use(cors({ origin: true }));

app.post("/authenticate", async (req, res) => {
  const { username } = req.body;

try {
    const r = await axios.put(
        "https://api.chatengine.io/users/",
        { username: username, secret: username, first_name: username },
        {headers: {"private-key": "f5740742-7099-468f-a82f-569a4a6e5a58"} }
    )
    return res.status(r.status).json(r.data)

} catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal Server Error" });
}
});

app.listen(3001);


