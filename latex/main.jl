function find_texfiles(rootdir::String)
    texfiles = String[]
    for dir in readdir(rootdir)
        isdir(dir) || continue
        files = find(readdir(dir)) do file
            endswith(file, ".tex")
        end
        if length(files) == 1
            f = joinpath(rootdir, dir, files[1])
            println(f)
            push!(texfiles, f)
        end
    end
    texfiles
end

rootdir = ""
find_texfiles(rootdir)
