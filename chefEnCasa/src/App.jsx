import { useState } from "react";
import "./App.css";
import Card from "./components/card";
import Header from "./components/header";
import HomePage from "./components/pagina";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <HomePage />
      <Card />
      <Header />
    </>
  );
}

export default App;
