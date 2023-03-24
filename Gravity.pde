private static final int SIZE = 800;

public boolean[][] grid = new boolean[SIZE][SIZE];

public void setup() {
  size(800, 800);
  for (int i = 0; i < SIZE; i++)
    for (int j = 0; j < i; j++)
      grid[i][j] = true;
  shuffle();
}

public void draw() {
  gravity();
  background(255);
  visualize();
}
public void gravity() {
  for (int i = 0; i < SIZE; i++) {
    for (int j = SIZE - 1; j > 1; j--) {
      if (!grid[j - 1][i] && grid[j - 2][i]) {
        grid[j - 1][i] = true;
        grid[j - 2][i] = false;
      } else if (!grid[j][i] && grid[j - 1][i]) {
        grid[j][i] = true;
        grid[j - 1][i] = false;
      }
    }
  }
}

public void visualize() {
  for (int i = 0; i < SIZE; i++) {
    int len = 0;
    for (int j = 0; j < SIZE; j++) {
      if (!grid[i][j]) {
        point(len, i);
        break;
      }
      len += 1;
    }
  }
}

private void shuffle() {
  for (int i = 0; i < SIZE * 10; i++) {
    int idx1 = (int) (Math.random() * SIZE);
    int idx2 = (int) (Math.random() * SIZE);
    boolean[] oldRow = grid[idx1];
    grid[idx1] = grid[idx2];
    grid[idx2] = oldRow;
  }
}
