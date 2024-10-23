import "./pagina.css";

export default function HomePage() {
  return (
    <div className="caja">
      <div className="aliniamiento-boton-login">
        <button>Log In</button>
      </div>
      <header className="aliniamiento_header">
        <h1>Chef En Casa</h1>
        <div>
          <input type="text" placeholder="buscar..." />
          <button>🍳</button>
        </div>
      </header>
    </div>
  );
}
