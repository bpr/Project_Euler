import StringUtils

function char_to_digit(c::Char)
    if isdigit(c)
        return Int(c) - Int('0')
    else
        throw(ArgumentError(@sprintf("%c is not a digit", c)))
    end
end

function main()
    if length(ARGS) > 1
        filename = ARGS[1]
        n = parse(Int64, ARGS[2])
        a = readlines(filename)
        s = StringUtils.conc(a)
        max_product = -1
        for i in 1:(length(s)-n+1)
            product = reduce(*,
                             map(char_to_digit,
                                 collect(s[i:(i+n-1)])))
            if product > max_product
                max_product = product
            end
        end
        @printf("The maximum %d length product has value %d\n", n, max_product)
    else
        error("this program needs a single numeric argument")
    end
end

main()
