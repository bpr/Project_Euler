#!/usr/bin/env julia

function main()
    if length(ARGS) > 0
        n = parse(Int64, ARGS[1])
        accum = 0
        for i in 1:(n-1)
            if i % 3 == 0 || i % 5 == 0
                accum += i
            end
        end
        @printf("The sum of the numbers up to %d divisible by 3 or 5 is %d\n",
                n, accum)
    else
        error("this program needs a single numeric argument")
    end
end

main()
