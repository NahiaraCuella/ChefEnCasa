import React from "react";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "./card.css";

const RecipeSlider = () => {
  const recipes = [
    { id: 1, img: "./public/h.webp", title: "Hotcakes" },
    { id: 2, img: "./public/f.jpg", title: "Fideos con tuco" },
    { id: 3, img: "./public/p.avif", title: "Fideos con salsa y salchicha" },
  ];

  return (
    <div className="image-container">
      {recipes.map((recipe) => (
        <div key={recipe.id}>
          <img src={recipe.img} alt={recipe.title} className="image" />
          <h3>{recipe.title}</h3>
        </div>
      ))}
    </div>
  );
};

export default RecipeSlider;
