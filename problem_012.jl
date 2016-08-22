using IntUtils

function main()
    n = 1
    while true
        if num_factors(sum(1:n)) > 500
            break
        end
        n += 1
    end
    @printf("The first triangle number with over 500 factors is %d\n", sum(1:n))
end

main()
