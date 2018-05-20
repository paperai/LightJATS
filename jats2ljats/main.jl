include("tree.jl")
include("jats.jl")

path = ARGS[1]
tree = readjats(path)
open("sample-ljats.xml", "w") do f
    println(f, toxml(tree))
end
