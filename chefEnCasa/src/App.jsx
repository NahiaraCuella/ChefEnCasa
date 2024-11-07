import { useEffect, useState } from "react";
import Card from "./components/card";
import Header from "./components/Header";

import Boton from "./components/pagina";

function App() {
  useEffect(() => {
    fetch("http://127.0.0.1:5000/usuarios/1")
      .then((data) => data.json())
      .then((data) => console.log(data));
  }, []);
  return (
    <>
      <Boton />
      <Card />
      <Header />
    </>
  );
}

export default App;
