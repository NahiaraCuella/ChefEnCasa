/*import "./pagina.css";


export default function Boton() {
 return (
   <div className="caja">
     <div className="alineamiento-botones">
       <div className="alineamiento-boton-login">
         <button id="login-btn">👤</button>
       </div>
       <div className="alineamiento-boton-pais">
         <button id="country-btn">🇦🇷</button>
       </div>
     </div>
     <header className="alineamiento_header">
       <h1 className="titulo">Chef En Casa</h1>
       <div>
         <input className="busqueda" type="text" placeholder="buscar..." />
         <button>🍳</button>
       </div>
     </header>
   </div>
 );
}*/

import React, { useState, useEffect } from "react";
import "./pagina.css";

export default function Boton() {
  // Estado para el país seleccionado (emoji)
  const [selectedCountry, setSelectedCountry] = useState("🇦🇷");
  // Estado para mostrar u ocultar el menú de países
  const [isMenuVisible, setIsMenuVisible] = useState(false);

  // Función para manejar el clic en el botón de país
  const handleCountryClick = (event) => {
    event.stopPropagation(); // Evitar que el clic cierre el menú inmediatamente
    setIsMenuVisible(!isMenuVisible); // Toggle visibility del menú
  };

  // Función para cambiar el país seleccionado
  const handleCountrySelect = (emoji) => {
    setSelectedCountry(emoji); // Cambiar el emoji del país
    setIsMenuVisible(false); // Ocultar el menú después de la selección
  };

  // Función para cerrar el menú si se hace clic fuera
  const handleClickOutside = (event) => {
    if (
      !event.target.closest(".country-menu") &&
      !event.target.closest("#country-btn")
    ) {
      setIsMenuVisible(false); // Cerrar el menú si el clic es fuera del área del menú o botón
    }
  };

  // Hook para manejar el clic fuera del componente
  useEffect(() => {
    document.addEventListener("click", handleClickOutside);
    return () => {
      document.removeEventListener("click", handleClickOutside);
    };
  }, []);

  return (
    <div className="caja">
      <div className="alineamiento-botones">
        <div className="alineamiento-boton-login">
          <button id="login-btn">👤</button>
        </div>
        <div className="alineamiento-boton-pais">
          <button id="country-btn" onClick={handleCountryClick}>
            {selectedCountry}
          </button>
          {isMenuVisible && (
            <div className="country-menu">
              <ul>
                <li onClick={() => handleCountrySelect("🇦🇷")}>Argentina</li>
                <li onClick={() => handleCountrySelect("🇧🇷")}>Brasil</li>
                <li onClick={() => handleCountrySelect("🇨🇱")}>Chile</li>
                <li onClick={() => handleCountrySelect("🇲🇽")}>México</li>
                <li onClick={() => handleCountrySelect("🇪🇸")}>España</li>
              </ul>
            </div>
          )}
        </div>
      </div>
      <header className="alineamiento_header">
        <h1 className="titulo">Chef En Casa</h1>
        <div>
          <input className="busqueda" type="text" placeholder="buscar..." />
          <button>🍳</button>
        </div>
      </header>
    </div>
  );
}
