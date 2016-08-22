import StringUtils

function is_leap_year(year::Int64)
    if rem(year, 400) == 0
        return true
    elseif rem(year, 100) == 0
        return false
    elseif rem(year, 4) == 0
        return true
    else
        return false
    end
end

function days_in_month(month::Int64, year::Int64)
    if month == 4 || month == 6 || month == 9 || month == 11
        return 30
    elseif month == 2
        if is_leap_year(year)
            29
        else
            28
        end
    else
        31
    end
end

function main()
    day = 1
    num = 0
    for year in 1900:2000
        for month in 1:12
            day += days_in_month(month, year)
            day = rem(day, 7)
            if day == 0 # Sunday on first of the month
                if year == 1900
                    num += (month == 12) ? 1 : 0
                elseif year == 2000
                    num += (month == 12) ? 0 : 1
                else
                    num += 1
                end
            end
        end
    end
    @printf("%d Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)\n", num)
end

main()
