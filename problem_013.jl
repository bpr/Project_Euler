import StringUtils

function lines_to_bigints(a::Array{String,1})
    result::Array{BigInt,1} = []
    for s in a
        big = parse(BigInt, chomp(s))
        push!(result, big)
    end
    return result
end

function main()
    if length(ARGS) > 0
        filename = ARGS[1]
        a = readlines(filename)
        m = lines_to_bigints(a)
        s = string(sum(m))
        @printf("The first 10 digits are %s\n", s[1:10])
    else
        error("this program needs a single numeric argument")
    end
end

main()
