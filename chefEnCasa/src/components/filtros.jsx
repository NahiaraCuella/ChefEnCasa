import React, { useState } from "react";

const FiltroRecetas = () => {
  // Estado para el texto de búsqueda
  const [busqueda, setBusqueda] = useState("");

  // Datos de recetas (pueden venir de una API o un archivo local)
  const recetas = [
    {
      id: 1,
      nombre: "Hotcakes",
      ingredientes: [
        "harina Leudante",
        "leche",
        "huevo",
        "Ensecia de Vainilla",
        "Aceite",
        "azúcar",
      ],
    },
  ];

  // Filtrar recetas que coinciden con la búsqueda (por nombre o ingredientes)
  const recetasFiltradas = recetas.filter((receta) => {
    return (
      receta.nombre.toLowerCase().includes(busqueda.toLowerCase()) || // Filtrar por nombre
      receta.ingredientes.some(
        (ingrediente) =>
          ingrediente.toLowerCase().includes(busqueda.toLowerCase()) // Filtrar por ingrediente
      )
    );
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
            <h3>{receta.nombre}</h3>
            <p>
              <strong>Tipo:</strong> {receta.tipo}
            </p>
            <p>
              <strong>Ingredientes:</strong> {receta.ingredientes.join(", ")}
            </p>
            <p>
              <strong>Dificultad:</strong> {receta.dificultad}
            </p>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default FiltroRecetas;
