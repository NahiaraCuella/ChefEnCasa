import React from 'react';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

const RecipeSlider = () => {
  const recipes = [
    { id: 1, img: 'h', title: 'Receta 1' },
    { id: 2, img: 'url_de_la_imagen_2', title: 'Receta 2' },
    { id: 3, img: 'url_de_la_imagen_3', title: 'Receta 3' },
    // Agrega más recetas aquí
  ];

  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
  };

  return (
    <div>
      <h2>Recetas</h2>
      <Slider {...settings}>
        {recipes.map(recipe => (
          <div key={recipe.id}>
            <img src={recipe.img} alt={recipe.title} style={{ width: '100%', height: 'auto' }} />
            <h3>{recipe.title}</h3>
          </div>
        ))}
      </Slider>
    </div>
  );
};

export default RecipeSlider;