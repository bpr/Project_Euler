using IntUtils

function is_abundant(n::Integer)
    d = proper_divisors(n)
    s = sum(d)
    if s > n
        return true
    else
        return false
    end
end

function is_sum_of_pairs_from(n::Integer, s::Set{Integer})
    for elt in s
        d = n - elt
        if d > 0 && d in s
            return true
        end
    end
    return false
end

function main()
    abundants = Set{Integer}()
    for i in 12:28123
        if is_abundant(i)
            push!(abundants, i)
        end
    end
    s = 0
    for i in 1:28123
        if !is_sum_of_pairs_from(i, abundants)
            s += i
        end
    end
    @printf("The sum of all numbers not the sum of two abundant numbers is %d\n", s)
end

main()
