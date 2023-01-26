function f()
    numbers = []
    push!(numbers, 0)
    for _ in 1:10
        push!(numbers, rand())
    end
    return numbers
end
function f2()
    numbers = Float64[]
    push!(numbers, 0)
    for _ in 1:10
        push!(numbers, rand())
    end
    return numbers
end

struct Obj
    count::Int
    value::AbstractFloat
end

objs = [Obj(rand(0:10), 10.0f0) for _ in 1:100]

function get_sum(objs)
    sum(x->x.value, objs)
end

struct Obj2{T<:AbstractFloat}
    count::Int
    value::T
end

objs = [Obj2(rand(0:10), i % 2 == 0 ? 1.0 : 1.0f0) for i in 1:100]
