module MPAGS_Slides_Examples

function init_vector(nrows, ncols)
    return [rand(10:99, ncols) for _ in 1:nrows]
end

function serialise(rows::Vector{Vector{T}}) where {T}
    output = ""
    for row in rows
        for col_idx in eachindex(row)
            val = row[col_idx]
            output = output * string(val) # string concat
            if col_idx < length(row)
                output = output * ","
            end
        end
        # add a newline
        output = output * "\n"
    end
    return output
end

function serialise_fast(rows::Vector{Vector{T}}) where {T}
    buffer = IOBuffer()
    for row in rows
        for col_idx in eachindex(row)
            val = row[col_idx]
            print(buffer, val)
            if col_idx < length(row)
                print(buffer, ",")
            end
        end
        # add a newline
        print(buffer, "\n")
    end
    return String(take!(buffer))
end

export serialise, serialise_fast, init_vector

end # module MPAGS_Slides_Examples
