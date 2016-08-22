using StringUtils

function main()
    product = 0
    for a = 1:998
        for b = (a+1):999
            c = 1000 - a - b
            if c > a && c > b && c^2 == a^2 + b^2
                @printf("(a,b,c) = (%d, %d, %d)\n", a, b, c)
                product = a * b * c
            end
        end
    end

    @printf("The Pythagorean triplet product is %d\n", product)
end

main()
