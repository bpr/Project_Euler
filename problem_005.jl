using IntUtils

function main()
    if length(ARGS) > 0
        n = parse(Int64, ARGS[1])
        a = Dict{Int64,Int64}[]
        for i in 2:n
            push!(a, prime_factors_table(i))
        end
        prod = 1
        for i in 2:n
            maxp = 0
            for j in 1:(n-1)
                p = get(a[j], i, 0)
                if p > maxp
                    maxp = p
                end
            end
            if maxp > 0
                prod *= i ^ maxp
            end
        end
        
        @printf("The smallest number that can be divided by each of the numbers from 1 to %d without any remainder is %d\n", n, prod)
    else
        error("this program needs a single numeric argument")
    end
    
end

main()
