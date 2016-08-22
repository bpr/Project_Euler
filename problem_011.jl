import StringUtils

function main()
    if length(ARGS) > 0
        filename = ARGS[1]
        n = 4
        a = readlines(filename)
        m = StringUtils.grid_to_matrix(a)
        max_product = -1
        x = -1
        y = -1
        s = "blah"
        l = length(m)
        for i in 1:l
            for j in 1:l
                across = 0
                down = 0
                diagup = 0
                diagdown = 0
                if j < (l - 2)
                    across = m[i][j] * m[i][j+1] * m[i][j+2] * m[i][j+3]
                end
                if i < (l - 2) && j < (l - 2)
                    diagdown = m[i][j] * m[i+1][j+1] * m[i+2][j+2] * m[i+3][j+3]
                end
                if i - 3 > 0 && j < (l - 2)
                    diagup = m[i][j] * m[i-1][j+1] * m[i-2][j+2] * m[i-3][j+3]
                end
                if i < (l - 2)
                    down = m[i][j] * m[i+1][j] * m[i+2][j] * m[i+3][j]
                end
                product = max(across, diagdown, diagup, down)
                if product > max_product
                    max_product = product
                    x = i
                    y = j
                    if max_product == across
                        s = "across"
                    elseif max_product == down
                        s = "down"
                    elseif max_product == diagdown
                        s = "diagdown"
                    else
                        s = "diagup"
                    end
                end
            end
        end
        @printf("The maximum 4 length product has value %d, at (%d, %d) %s\n",
                max_product, x, y, s)
    else
        error("this program needs a single numeric argument")
    end
end

main()
