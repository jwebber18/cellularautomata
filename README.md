# Cellular Automata + Game Of Life
Command-line tool to create .png snapshots of cellular automata and Conway's game of life simulations.

# Installation
[Install Elixir](https://elixir-lang.org/install.html)

Install dependencies:

```mix deps.get```

Start it up:

```iex -S mix```

# Usage

## Create a single cellular automata for given ruleset with given number of rows:

```CellularAutomata.main(rule_int, num_rows)```

### Rule 30 -- 1000 rows

```CellularAutomata.main(30, 1000)```

![](https://i.imgur.com/L0jjckx.png)

### Rule 150 -- 1000 rows

```CellularAutomata.main(150, 1000)```

![](https://imgur.com/HwAPI4X.png)

## Feed cellular automata for given ruleset with given number of rows through game of life for given number of rounds:

```CellularAutomata.main(rule_int, num_rows, rounds)```

A .png snapshot will be taken for each round (gifs sold separately).

### Rule 30 -- 100 rows -- 250 rounds

```CellularAutomata.main(30, 100, 250)```

![](https://i.imgur.com/ma88Vuv.gif)

### Rule 54 -- 100 rows -- 250 rounds

```CellularAutomata.main(54, 100, 250)```

![](https://imgur.com/UUCEVdI.gif)

### Rule 60 -- 100 rows -- 250 rounds

```CellularAutomata.main(60, 100, 250)```

![](https://imgur.com/8vWeyxP.gif)

### Rule 129 -- 100 rows -- 50 rounds

```CellularAutomata.main(129, 100, 50)```

![](https://imgur.com/oz7HzHJ.gif)

### Rule 205 -- 100 rows -- 50 rounds

```CellularAutomata.main(205, 100, 50)```

![](https://imgur.com/dxo3vuv.gif)

### Rule 222 -- 100 rows -- 50 rounds

```CellularAutomata.main(222, 100, 50)```

![]()

### Rule 37 -- 100 rows -- 50 rounds

```CellularAutomata.main(37, 100, 50)```

![](https://imgur.com/5kCMJzx.gif)

### Rule 76 -- 100 rows -- 50 rounds

```CellularAutomata.main(76, 100, 50)```

![](https://imgur.com/SpAc0SK.gif)

## Generate random board of given width and height, feed it through game of life for given number of rounds:

```GameOfLife.main(width, height, rounds)```

### 200 x 200 -- 150 rounds

```GameOfLife.main(200, 200 ,150)```

![](https://imgur.com/iF946lh.gif)
