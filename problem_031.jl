using ZeroIndex

function count_change(mat::Array{Int64, 2},
                      denom::Int64,
                      row::Int64,
                      col::Int64)::Int64
    prev_col = col - denom
    prev_row = row - 1
    denom_in = 0
    denom_out = 0
    if prev_row >= 0
        denom_out = aget(mat, prev_row, col)
    end
    if prev_col >= 0
        denom_in = aget(mat, row, prev_col)
    end
    return denom_in + denom_out
end

function main()
    denoms = [1, 2, 5, 10, 20, 50, 100, 200]
    sought = 200
    ndenoms = length(denoms)
    nways = Array{Int64, 2}(ndenoms, sought + 1)
    for row = 0:(ndenoms-1)
        aset!(nways, row, 0, 1)
    end
    for col in 1:sought
        for row in 0:(ndenoms-1)
            denom = vget(denoms, row)
            val = count_change(nways, denom, row, col)
            aset!(nways, row, col, val)
        end
    end
    @printf("number of ways is = %d\n", aget(nways, ndenoms-1, sought))
end

main()
