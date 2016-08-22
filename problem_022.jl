import StringUtils

function main()
    if length(ARGS) > 0
        filename = ARGS[1]
        tbl = vec(readcsv("p022_names.txt", String))
        sort!(tbl)
        result = 0
        for i in 1:length(tbl)
            s = tbl[i]
            n = reduce(+, 0, map((c) -> Int(c) - Int('A') + 1, collect(s)))
            result += i*n
        end
        @printf("The total is %d\n", result)
    else
        error("this program needs a single numeric argument")
    end
end

main()
