# Cellular Automata + Game Of Life
Command-line tool to create .png snapshots of cellular automata and Conway's game of life simulations.

# Installation
[Install Elixir](https://elixir-lang.org/install.html)

Install dependencies:

```mix deps.get```

Start it up:

```iex -S mix```

# Usage

Create a single cellular automata for given ruleset with given number of rows:

```CellularAutomata.main(rule_int, num_rows)```

Rule 30 -- 1000 rows

```CellularAutomata.main(30, 1000)```

![Rule 30, 1000 rows](https://imgur.com/L0jjckx)
