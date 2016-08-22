#!/usr/bin/env julia

function main()
    if length(ARGS) > 0
        n = parse(Int64, ARGS[1])
        save_n = n
        factors = Int64[]
        d = 2
        while n > 1
            while n % d == 0
                push!(factors, d)
                n = div(n,d)
            end
            d += 1
            if d * d > n
                if n > 1
                    push!(factors, n)
                end
                break
            end
        end

        @printf("The largest prime factor of %d is %d\n",
                save_n, factors[length(factors)])
    else
        error("this program needs a single numeric argument")
    end
end

main()
