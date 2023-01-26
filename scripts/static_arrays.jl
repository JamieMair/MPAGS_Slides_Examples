using StaticArrays
using BenchmarkTools

function cross(a, b)
    [
        (a[2]*b[3]-a[3]*b[2]),
        (a[3]*b[1]-a[1]*b[3]),
        (a[1]*b[2]-a[2]*b[1])
    ]
end

a = rand(3);
b = rand(3);

@btime cross($a, $b)


function cross(a::SVector, b::SVector)
    SVector(
        (a[2]*b[3]-a[3]*b[2]),
        (a[3]*b[1]-a[1]*b[3]),
        (a[1]*b[2]-a[2]*b[1])
    )
end

a_static = SVector(a...);
b_static = SVector(b...);
@btime cross($a_static, $b_static);