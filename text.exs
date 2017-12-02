defmodule Patrick do
    def start do
        list = [2459, 2269, 2250, 2194, 2063, 1856, 1753, 1704, 1668, 1280, 615, 190, 163, 158, 150, 146]
        find_difference_of_divisbles(list, nil, nil)
    end

    def find_difference_of_divisbles(_, result, first) when result != nil do
        div(first, result)
    end

    def find_difference_of_divisbles([first | rest], nil, _) do
        result = Enum.find(rest, &(rem(first, &1) == 0))
        find_difference_of_divisbles(rest, result, first)
    end

end

IO.inspect Patrick.start