import React, { useState } from "react";



function Login() {
  const [formData, setFormData] = useState({
    user: "",
    email: "",
    password: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Datos enviados:", formData);
    // Aquí puedes agregar la lógica para manejar el envío del formulario
  };

  return (
    <div style={styles.container}>
      <div style={styles.loginBox}>
        <h2>LOG IN/ LOG OUT</h2>
        <form onSubmit={handleSubmit}>
          <div style={styles.inputBox}>
            <input
              type="text"
              name="user"
              value={formData.user}
              onChange={handleChange}
              required
              style={styles.input}
            />
            <label style={styles.label}>user</label>
          </div>
          <div style={styles.inputBox}>
            <input
              type="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              required
              style={styles.input}
            />
            <label style={styles.label}>email</label>
          </div>
          <div style={styles.inputBox}>
            <input
              type="password"
              name="password"
              value={formData.password}
              onChange={handleChange}
              required
              style={styles.input}
            />
            <label style={styles.label}>contraseña</label>
          </div>
          <div style={styles.buttonBox}>
            <button type="button" style={styles.button}>
              atras
            </button>
            <button type="submit" style={styles.button}>
              next
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

const styles = {
  container: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    height: "100vh",
    backgroundColor: "#d3d3d3",
  },
  loginBox: {
    backgroundColor: "#c4c4c4",
    padding: "20px",
    borderRadius: "10px",
    boxShadow: "0px 0px 10px rgba(0, 0, 0, 0.1)",
    width: "300px",
    textAlign: "center",
  },
  inputBox: {
    position: "relative",
    marginBottom: "20px",
  },
  input: {
    width: "100%",
    padding: "10px",
    background: "none",
    border: "none",
    borderBottom: "2px solid #000",
    outline: "none",
    fontSize: "16px",
  },
  label: {
    position: "absolute",
    top: "10px",
    left: "10px",
    pointerEvents: "none",
    transition: "0.5s",
    color: "#555",
  },
  buttonBox: {
    display: "flex",
    justifyContent: "space-between",
  },
  button: {
    backgroundColor: "#888",
    color: "#fff",
    padding: "10px",
    border: "none",
    cursor: "pointer",
    width: "45%",
  },
};

export default Login;
