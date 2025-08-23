import numpy as np
import matplotlib.pyplot as plt

# Geração da malha de pontos
x = np.linspace(-1, 1, 21)
y = np.linspace(-1, 1, 21)
X, Y = np.meshgrid(x, y)

# Campo A = (x, y)
U_A = X
V_A = Y

# Campo B = (x, -y)
U_B = X
V_B = -Y

# Plot
fig, axs = plt.subplots(1, 2, figsize=(10, 5))

# Campo A
axs[0].quiver(X, Y, U_A, V_A)
axs[0].set_title(r'Campo (a)  $\mathbf{A} = x\hat{i} + y\hat{j}$')
axs[0].set_xlabel('x')
axs[0].set_ylabel('y')
axs[0].set_aspect('equal')
axs[0].grid(True)

# Campo B
axs[1].quiver(X, Y, U_B, V_B)
axs[1].set_title(r'Campo (b)  $\mathbf{B} = x\hat{i} - y\hat{j}$')
axs[1].set_xlabel('x')
axs[1].set_ylabel('y')
axs[1].set_aspect('equal')
axs[1].grid(True)

plt.tight_layout()
plt.show()
