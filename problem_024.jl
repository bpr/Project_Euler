using CombUtils

function main()
    a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    for i = 2:1_000_000
        next_permutation!(a)
    end
    println(reduce(*, map((n) -> string(n), a)))
end

main()
