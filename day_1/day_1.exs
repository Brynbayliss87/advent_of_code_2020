list = File.read!(Path.expand("day_1/input.txt"))
       |> String.split("\n", trim: true)
       |> Enum.map(fn x -> String.to_integer(x) end)

Enum.map(list, fn x ->
  List.delete(list, x)
  |> Enum.map(fn z ->
    List.delete(list, z)
    |> Enum.map(fn y -> case {z + x + y} do
    {2020} ->
      IO.puts z * x * y
    _ ->
      "wazz"
    end
    end)
  end)
end)
