import React, { useState } from "react";
import "./card.css";

const FiltroRecetas = () => {
  // Estado para el texto de búsqueda
  const [busqueda, setBusqueda] = useState("");

  // Datos de recetas (pueden venir de una API o un archivo local)
  const recetas = [
    {
      id: 8,
      img: "/hotcakes.jpg",
      title: "Hotcakes",
    },
    { id: 7, img: "/f.jpg", title: "Fideos con tuco" },
    { id: 6, img: "/p.avif", title: "Fideos con salsa y salchicha" },
    {
      id: 9,
      img: "/pastel-de-papas.jpg",
      title: "Pastel de Papas",
    },
    {
      id: 10,
      img: "/budin-de-pan.jpg",
      title: "Bundin de Pan",
    },
    {
      id: 11,
      img: "M.jpg",
      title: "Milanesa napolitana con papas fritas",
    },
  ];

  // Filtrar recetas que coinciden con la búsqueda (por nombre o ingredientes)
  const recetasFiltradas = recetas.filter((receta) => {
    return receta.title.toLowerCase().includes(busqueda.toLowerCase());
  });

  // Manejar cambios en el input de búsqueda
  const handleChange = (e) => {
    setBusqueda(e.target.value);
  };

  return (
    <div>
      <h1>Filtrar Recetas</h1>

      {/* Campo de búsqueda */}
      <div>
        <label>Buscar receta: </label>
        <input
          type="text"
          value={busqueda}
          onChange={handleChange}
          placeholder="Buscar por nombre o ingrediente"
        />
      </div>

      <h2>Recetas encontradas</h2>
      <ul>
        {recetasFiltradas.map((receta) => (
          <li key={receta.id}>
            <h3>{receta.title}</h3>
            <img src={receta.img} className="image" />
          </li>
        ))}
      </ul>
    </div>
  );
};

export default FiltroRecetas;
