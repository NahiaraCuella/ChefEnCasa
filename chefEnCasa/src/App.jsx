import { useEffect, useState } from "react";
import Card from "./components/card";
import Header from "./components/header";

function App() {
  useEffect(() => {
    fetch("http://127.0.0.1:5000/usuarios/1")
      .then((data) => data.json())
      .then((data) => console.log(data));
  }, []);
  return (
    <>
      <Card />
      <Header />
    </>
  );
}

export default App;
