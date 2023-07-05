class Grid {
  final int rows;
  final int cols;
  final List<List<int>> grid;

  Grid(this.rows, this.cols)
      : grid = List<List<int>>.generate(
            rows, (i) => List<int>.generate(cols, (j) => 0));

  void set(int row, int col, int value) {
    grid[col][row] = value;
  }

  int get(int row, int col) {
    return grid[col][row];
  }

  @override
  String toString() {
    return grid.map((row) => row.join(',')).join(';');
  }
}
