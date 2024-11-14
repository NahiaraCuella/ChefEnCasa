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

/*

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
          <img src="../../public/Logo.png" alt="" className="header_imagen"/>
        <div>
          <input className="busqueda" type="text" placeholder="buscar..." />
          <button>🍳</button>
        </div>
      </header>
    </div>
  );
}*/

import React, { useState, useEffect } from "react";
import "./pagina.css"; // Asegúrate de tener los estilos correctos


export default function Boton() {
 // Estado para el país seleccionado (emoji)
 const [selectedCountry, setSelectedCountry] = useState("🇦🇷");
 // Estado para mostrar u ocultar el menú de países
 const [isMenuVisible, setIsMenuVisible] = useState(false);
 // Estado para mostrar u ocultar el formulario de inicio de sesión
 const [isLoginVisible, setIsLoginVisible] = useState(false);


 // Estado para los datos del formulario de login
 const [formData, setFormData] = useState({
   user: "",
   email: "",
   password: "",
 });


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


 // Función para manejar el clic fuera de la ventana emergente o el menú
 const handleClickOutside = (event) => {
   // Cerrar tanto el menú de países como el formulario de login si el clic es fuera de ambos
   if (
     !event.target.closest(".country-menu") &&
     !event.target.closest("#country-btn") &&
     !event.target.closest(".login-box")
   ) {
     setIsMenuVisible(false);
     setIsLoginVisible(false); // Cerrar el login si se hace clic fuera de la ventana de login
   }
 };


 // Hook para manejar el clic fuera del componente
 useEffect(() => {
   document.addEventListener("click", handleClickOutside);
   return () => {
     document.removeEventListener("click", handleClickOutside);
   };
 }, []);


 // Función para manejar el cambio de datos en el formulario de login
 const handleInputChange = (e) => {
   const { name, value } = e.target;
   setFormData({
     ...formData,
     [name]: value,
   });
 };


 // Función para manejar el envío del formulario de login
 const handleSubmit = (e) => {
   e.preventDefault();
   console.log("Formulario enviado:", formData);
   // Aquí puedes agregar la lógica para manejar el envío del formulario
 };


 return (
   <div className="caja">
     <div className="alineamiento-botones">
       <div className="alineamiento-boton-login">
         <button
           id="login-btn"
           onClick={(e) => {
             e.stopPropagation();
             setIsLoginVisible(!isLoginVisible); // Toggle visibility del login
           }}
         >
           👤
         </button>
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


     {/* Formulario de inicio de sesión (ventana emergente) */}
     {isLoginVisible && (
       <div className="login-overlay">
         <div className="login-box">
           <h2>Iniciar Sesión</h2>
           <form onSubmit={handleSubmit}>
             <div className="input-box">
               <input
                 type="text"
                 name="user"
                 value={formData.user}
                 onChange={handleInputChange}
                 required
                 className="input"
                 placeholder="Usuario"
               />
             </div>
             <div className="input-box">
               <input
                 type="email"
                 name="email"
                 value={formData.email}
                 onChange={handleInputChange}
                 required
                 className="input"
                 placeholder="Correo Electrónico"
               />
             </div>
             <div className="input-box">
               <input
                 type="password"
                 name="password"
                 value={formData.password}
                 onChange={handleInputChange}
                 required
                 className="input"
                 placeholder="Contraseña"
               />
             </div>
             <div className="button-box">
               <button
                 type="button"
                 className="button"
                 onClick={() => setIsLoginVisible(false)}
               >
                 Cerrar
               </button>
               <button type="submit" className="button">
                 Iniciar Sesión
               </button>
             </div>
           </form>
         </div>
       </div>
     )}


     <header className="alineamiento_header">
       <h1 className="titulo">Chef En Casa</h1>
       <div>
         <input className="busqueda" type="text" placeholder="Buscar..." />
         <button>🍳</button>
       </div>
     </header>
   </div>
 );
}




