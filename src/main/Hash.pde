public class Hash {
  int dato;
  int estado; //0 = Vacío, 1 = Eliminado, 2 = Ocupado

  int funcion(int n, int m) {
    return ((n + 1) % m);
  }

  void insertaHash(Hash[] h, int m, int n) {
    boolean i = false;
    int j = funcion(n, m);
    do {
      if (h[j].estado == 0 || h[j].estado == 1) {
        h[j].dato = n;
        h[j].estado = 2;
        i = true;
      } else {
        j++;
      }
    } while (j < m && !i);
    if (i) {
      javax.swing.JOptionPane.showMessageDialog(null, "¡Elemento insertado con éxito!");
    } else {
      javax.swing.JOptionPane.showMessageDialog(null, "¡Tabla llena!");
    }
  }

  int buscaHash(Hash[] h, int m, int n) {
    int j = funcion(n, m);
    while (j < m) {
      if (h[j].estado == 0) {
        return -1;
      } else if (h[j].dato == n) {
        if (h[j].estado == 1) {
          return -1;
        } else {
          return j;
        }
      } else {
        j++;
      }
    }
    return -1;
  }

  int eliminaHash(Hash[] h, int m, int n) {
    int i = buscaHash(h, m, n);
    if (i == -1) {
      return -1;
    } else {
      h[i].estado = 1;
      return 1;
    }
  }
}
