using IntUtils

# Why can't I write the following on one line?
const RIGHT = 0
const DOWN = 1
const LEFT = 2
const UP = 3

function next_grid_elt(dir, r, c)
    if dir == RIGHT
        return (r, c + 1)
    elseif dir == DOWN
        return (r + 1, c)
    elseif dir == LEFT
        return (r, c - 1)
    elseif dir == UP
        return (r - 1, c)
    else
        return (0, 0)
    end
end

function next_dir(dir)
    return (dir + 1) % 4
end

function lookup_index{T<:Integer}(dim::T, row::T, col::T)::T
    dir = RIGHT
    runlen = 1
    r = div(dim, 2) + 1
    c = div(dim, 2) + 1
    value = 1
    if r == row && c == col
        return value
    end

    runlen = 1
    max_value = dim * dim

    while value < max_value
        for step in 1:2*runlen
            (r, c) = next_grid_elt(dir, r, c)
            value += 1
            if r == row && c == col
                return value
            end
            if step == runlen
                dir = next_dir(dir)
            end
        end
        runlen += 1
        dir = next_dir(dir)
    end
    error(@sprintf("dim=%d, row=%d, col=%d, r=%d, c=%d, value=%d\n",
                   dim, row, col, r, c, value))
end

function main()
    dim = 1001
    ul_diag = 0
    ll_diag = 0
    center = div(dim, 2) + 1
    for d in 1:dim
        ul_diag += lookup_index(dim, d, d)
        ll_diag += lookup_index(dim, dim - d + 1, d)
    end
    v = ul_diag + ll_diag - lookup_index(dim, center , center)
    @printf("array sum over diagonals for dim = %d is %d\n", dim, v)
end

main()
