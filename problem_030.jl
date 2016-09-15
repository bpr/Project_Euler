function main()
    result = 0
    for i in 2:1_000_000
        if i == reduce(+, map((x) -> x^5, digits(i)))
            result += i
        end
    end
    @printf("sum of terms = %d\n", result)
end

main()
