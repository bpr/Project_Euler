using IntUtils

function main()
    s = 0
    for i in 1:9999
        if is_amicable(i)
            @printf("%d is amicable\n", i)
            s += i
        end
    end
    @printf("The sum of amicable numbers from 1 to 9999 is %d\n", s)
end

main()
