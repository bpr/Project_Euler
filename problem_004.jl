using StringUtils

function main()
    factors = Int64[]
    max_product = -1
    product = 0
    for i = 999:-1:100
        for j = 999:-1:100
            product = i * j
            if StringUtils.is_palindrome(string(product)) &&
               product > max_product
                max_product = product
            end
        end
    end

    @printf("The largest palindromic product of two 3 digit integers is %d\n",
            max_product)
end

main()
