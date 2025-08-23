import numpy as np
import matplotlib.pyplot as plt

# Definindo o domínio
x = np.linspace(-1, 1, 200)
y = np.linspace(-1, 1, 200)
X, Y = np.meshgrid(x, y)

# Definindo o campo escalar
psi = X*Y**2 + 5*X**2 - 3*Y - 7

# --- Gráfico de contorno (2D) ---
plt.figure(figsize=(7,6))
contour = plt.contourf(X, Y, psi, levels=30, cmap="viridis")
plt.colorbar(contour, label="ψ(x, y)")
plt.xlabel("x")
plt.ylabel("y")
plt.title("Mapa de contorno do campo escalar ψ(x,y)")
plt.show()

# --- Gráfico de superfície (3D) ---
from mpl_toolkits.mplot3d import Axes3D
fig = plt.figure(figsize=(8,6))
ax = fig.add_subplot(111, projection='3d')
ax.plot_surface(X, Y, psi, cmap="viridis")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_zlabel("ψ(x,y)")
ax.set_title("Superfície do campo escalar ψ(x,y)")
plt.show()
