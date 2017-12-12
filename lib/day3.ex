defmodule Day3 do
  defmodule Part1 do
    def steps(number) when number == 1, do: 0
    def steps(number) do
      root = Float.ceil :math.sqrt(number)
      width = get_width(root, 0, 0)
      max = :math.pow(width, 2)
      ring = (width - 1) / 2
      middle = Float.ceil(width / 2)
      offset = width - middle
      max_coords = {offset, -ring}
      {x, y} = coords(number, max, max_coords, offset)
      abs(x) + abs(y)
    end

    def get_width(root, base, result) when result >= root, do: result
    def get_width(root, base, result) do
      get_width(root, base+1, base * 2 + 1)
    end

    def coords(number, current, current_coords, offset) when number == current, do: current_coords
    def coords(number, current, {x, y}, offset) when x > -offset and y == -offset do
      coords(number, current-1, {x-1, y}, offset)
    end
    def coords(number, current, {x, y}, offset) when x == -offset and y < offset do
      coords(number, current-1, {x, y+1}, offset)
    end
    def coords(number, current, {x, y}, offset) when x < offset and y == offset do
      coords(number, current-1, {x+1, y}, offset)
    end
    def coords(number, current, {x, y}, offset) when x == offset and y > -offset do
      coords(number, current-1, {x, y-1}, offset)
    end
  end

  defmodule Part2 do
    def doit(number) do
      map = %{x0y0: 1}
      ring = 0
      x=0
      y=0
      bigger_number(number, map, ring, x, y, 0)
    end

    def bigger_number(number, map, ring, x, y, bigger) when bigger > number, do: bigger
    def bigger_number(number, map, ring, x, y, bigger) do
      width = ring * 2 + 1
      middle = Float.ceil(width / 2)
      offset = width - middle
      {new_x, new_y, new_ring} = Day3.Part2.coords({x, y}, offset, ring)
      next_coords = String.to_atom("x#{new_x}y#{new_y}")
      new_bigger = Day3.Part2.next_number(map, new_ring, new_x, new_y)
      new_map = Map.put(map, next_coords, new_bigger)
      bigger_number(number, new_map, new_ring, new_x, new_y, new_bigger)
    end

    def next_number(map, ring, x, y) do
      sum_of_surrounding(map, x, y)
    end

    def sum_of_surrounding(map, x, y) do
      list = ["x#{x+1}y#{y}", "x#{x+1}y#{y+1}", "x#{x}y#{y+1}", "x#{x-1}y#{y+1}", "x#{x-1}y#{y}", "x#{x-1}y#{y-1}", "x#{x}y#{y-1}", "x#{x+1}y#{y-1}"]
      sum_list(map, list, 0)
    end

    def sum_list(map, list, sum) when list == [], do: sum
    def sum_list(map, [head | rest], sum) do
      x = map[String.to_atom(head)] || 0
      sum_list(map, rest, sum + x)
    end

    def coords({x, y}, offset, ring) when x == offset and y == -offset do
      new_ring = ring + 1
      {x+1, y, new_ring}
    end
    def coords({x, y}, offset, ring) when x == offset and y < offset do
      {x, y+1, ring}
    end
    def coords({x, y}, offset, ring) when y == offset and x > -offset do
      {x-1, y, ring}
    end
    def coords({x, y}, offset, ring) when x == -offset and y > -offset do
      {x, y-1, ring}
    end
    def coords({x, y}, offset, ring) when y == -offset and x < offset do
      {x+1, y, ring}
    end
  end
end
