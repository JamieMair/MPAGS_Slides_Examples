using BenchmarkTools

function example_f(x)
    s = 0
    for x_i in x
        s += x_i
    end
    s
end

function calc_summary(rows)
    return sum(example_f, rows)
end

rows = [rand(rand(0:10)) for _ in 1:10000];

@benchmark calc_summary($rows)




function example_f_stable(x)
    s = zero(eltype(x))
    for x_i in x
        s += x_i
    end
    s
end

function calc_summary_stable(rows)
    return sum(example_f_stable, rows)
end

@benchmark calc_summary_stable($rows)