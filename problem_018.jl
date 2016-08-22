import StringUtils

function main()
    if length(ARGS) > 0
        filename = ARGS[1]
        a = readlines(filename)
        m = StringUtils.grid_to_matrix(a)
        l = length(m)
        for row in 2:l
            ncols = length(m[row])
            for col in 1:ncols
                left = col == 1 ? 0 : m[row-1][col-1]
                right = col == ncols ? 0 : m[row-1][col]
                m[row][col] += max(left, right)
            end
        end
        @printf("The maximum total has value %d\n",maximum(m[l]))
    else
        error("this program needs a single numeric argument")
    end
end

main()
