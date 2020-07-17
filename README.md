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

A .png snapshot will be taken for each round.

### Rule 30 -- 100 rows -- 250 rounds

```CellularAutomata.main(30, 100, 250)```

![](https://i.imgur.com/ma88Vuv.gif)

