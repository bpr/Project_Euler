
module StringUtils

export is_palindrome
function is_palindrome(s)
    len = length(s)
    for i = 1:div(len, 2)
        if s[i] != s[len + 1 - i]
            return false
        end
    end
    return true
end

export conc
function conc(a::Array{String,1})
    buf = IOBuffer()
    for s in a
        print(buf, chomp(s))
    end
    takebuf_string(buf)
end

export grid_to_matrix
function grid_to_matrix(a::Array{String,1})
    result::Array{Array{Int64,1},1} = []
    for s in a
        row = map(x -> parse(Int64, x), split(chomp(s)))
        push!(result, row)
    end
    return result
end

end
