import { useEffect, useState } from "react";
import Card from "./components/card";

import Boton from "./components/pagina";
import Login from "./components/Login";

function App() {
  useEffect(() => {
    fetch("http://127.0.0.1:5000/usuarios/1")
      .then((data) => data.json())
      .then((data) => console.log(data));
  }, []);
  return (
    <>
    <Login />
      <Boton />
      <Card />
    </>
  );
}

export default App;

/*
import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import Card from './components/card'
import Header from './components/header'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <Card/>
      <Header/>
    </>
  )
}

export default App

*/
