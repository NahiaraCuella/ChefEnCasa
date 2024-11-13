import React, { useState } from "react";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "./card.css";

const RecipeSlider = () => {
  const [recipe, setRecipe] = useState(null); // Para almacenar la receta seleccionada
  const [loading, setLoading] = useState(false); // Para manejar el estado de carga
  const [error, setError] = useState(null); // Para manejar posibles errores

  const recipes = [
    {
      id: 8,
      img: "/hotcakes.jpg",
      title: "Hotcakes",
    },
    { id: 7, img: "/f.jpg", title: "Fideos con tuco" },
    { id: 6, img: "/p.avif", title: "Fideos con salsa y salchicha" },
  ];

  // Función para obtener la receta por ID desde la API Flask usando fetch
  const getRecipeById = (id) => {
    setLoading(true); // Empieza la carga
    setError(null); // Resetea cualquier error anterior

    fetch(`http://127.0.0.1:5000/receta/${id}`)
      .then((response) => {
        if (!response.ok) {
          throw new Error("Receta no encontrada");
        }
        return response.json(); // Convierte la respuesta en formato JSON
      })
      .then((data) => {
        console.log(data);
        setRecipe(data); // Guarda la receta en el estado
      })
      .catch((error) => {
        console.error("Error fetching recipe:", error);
        setError(error.message); // Guarda el error en el estado
        setRecipe(null); // Resetea la receta
      })
      .finally(() => {
        setLoading(false); // Termina la carga
      });
  };

  return (
    <div>
      {/* Slider de recetas */}
      <div className="image-container">
        {recipes.map((recipeData) => (
          <div key={recipeData.id} onClick={() => getRecipeById(recipeData.id)}>
            <a target="_blank" rel="noopener noreferrer">
              <img
                src={recipeData.img}
                alt={recipeData.title}
                className="image"
              />
            </a>
            <h3>{recipeData.title}</h3>
          </div>
        ))}
      </div>

      {/* Mostrar detalles de la receta seleccionada */}
      {loading && <p>Loading...</p>}

      {recipe ? (
        <div className="recipe-details">
          <h2>{recipe.nombre_receta}</h2>
          <img src={recipe.image_url} alt={recipe.title} />

          <h3>Instrucciones:</h3>
          <p>{recipe.paso_a_paso}</p>
          <h3>Tipo de dificulta:</h3>
          <p>{recipe.tipo_de_dificultad}</p>
          <h3>Tiempo de coccion:</h3>
          <p>{recipe.tiempo_coccion}</p>
        </div>
      ) : (
        <>no se encontraros los detalles </>
      )}

      {/* Mostrar error si no se encuentra la receta */}
      {error && !loading && <p>{error}</p>}
    </div>
  );
};

export default RecipeSlider;
