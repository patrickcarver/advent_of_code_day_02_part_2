defmodule Day02Part2 do
  def start do
    get_input()
    |> create_rows_of_integers()
    |> sort()
    |> find_quotients()
    |> sum_quotients()
  end

  defp get_input do
    "../assets/input.txt"
    |> Path.expand(__DIR__)
    |> File.read!  
  end  

  defp create_rows_of_integers(string) do
    string
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, " ")))
    |> Enum.map(&(Enum.filter(&1, fn(elem) -> elem != "" end)))
    |> Enum.map(&(Enum.map(&1, fn(elem) -> String.to_integer(elem) end)))        
  end

  defp sort(rows) do
    rows
    |> Enum.map(&Enum.sort/1)
    |> Enum.map(&Enum.reverse/1)
  end

  defp find_quotients(rows) do
    Enum.map(rows, fn(row) -> find_quotient(row, nil, nil) end)
  end

  defp find_quotient(_, result, first) when result != nil do
    div(first, result)
  end  

  defp find_quotient([first | rest], nil, _) do
    result = Enum.find(rest, &(rem(first, &1) == 0))
    find_quotient(rest, result, first)
  end

  defp sum_quotients(rows) do
    Enum.reduce(rows, fn(elem, acc) -> elem + acc end)      
  end
end
