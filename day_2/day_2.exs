list = File.read!(Path.expand("day_2/input.txt"))
  |> String.split("\n", trim: true)
  |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
  |> Enum.filter(fn x ->
    {_status, indexes } =  Enum.fetch(x, 0)
    {_status, char} =  Enum.fetch(x, 1)
    char =  String.at(char, 0)
    {_status, pwd} = Enum.fetch(x, 2)
    index = String.split(indexes, "-")
    {_status, first} = Enum.fetch(index, 0)
    {_status, second} = Enum.fetch(index, 1)
    min = String.to_integer(first)
    max = String.to_integer(second)
    range = min..max
    count = pwd
            |> String.graphemes
            |> Enum.count(fn x -> x == char end)
    count in range
  end)

IO.puts Enum.count(list)

# part 2

list = File.read!(Path.expand("day_2/input.txt"))
  |> String.split("\n", trim: true)
  |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
  |> Enum.filter(fn x ->
    {_status, indexes } =  Enum.fetch(x, 0)
    {_status, char} =  Enum.fetch(x, 1)
    char =  String.at(char, 0)
    {_status, pwd} = Enum.fetch(x, 2)
    index = String.split(indexes, "-")
    {_status, first} = Enum.fetch(index, 0)
    {_status, second} = Enum.fetch(index, 1)
    first = String.to_integer(first) - 1
    second = String.to_integer(second) - 1
    cond do
      String.at(pwd, first) == char && String.at(pwd, second) != char ->
        true
      String.at(pwd, first) != char && String.at(pwd, second) == char ->
        true
      true ->
        false
    end
  end)

IO.puts Enum.count(list)


