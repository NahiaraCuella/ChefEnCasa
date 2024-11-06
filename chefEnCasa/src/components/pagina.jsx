import "./pagina.css";

export default function HomePage() {
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
        <h1>Chef En Casa</h1>
        <div>
          <input type="text" placeholder="buscar..." />
          <button>🍳</button>
        </div>
      </header>
    </div>
  );
}
