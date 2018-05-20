export readjats

using EzXML

struct UnsupportedException <: Exception
    message::String
end

"""
Read JATS file and returns `Tree` instance.
"""
function readjats(path::String)
    try
        xml_article = root(readxml(path))
        @assert nodename(xml_article) == "article"
        if countelements(xml_article) < 3
            warn("#xml elements < 3")
            return
        end

        article = Tree("article")
        xml_front = findfirst(xml_article, "front")
        push!(article, parse_front(xml_front))
        # push!(article[end], Tree("pdf-link",Tree("http://www.aclweb.org/anthology/P12-1046")))
        # push!(article[end], Tree("xml-link",Tree("http://example.xml")))

        body = findfirst(xml_article, "body")
        push!(article, parse_body(body))

        back = find(xml_article, "back")
        if !isempty(back)
            push!(article, parse_back(back[1]))
        end

        push!(article, Tree("floats-group"))
        append!(article[end], findfloats(article))
        floats = find(xml_article, "floats-group")
        if !isempty(floats)
            append!(article[end], parse_body(floats[1]).children)
        end
        isempty(article[end]) && deleteat!(article,length(article)) # no floats

        postprocess!(article)
        return article
    catch e
        if isa(e, UnsupportedException)
            println(e.message)
            return
        else
            rethrow(e)
        end
    end
end

"""
Convert EzXML.Node into `Tree`.

* dict: dictionary of keep nodes
"""
function Base.convert(::Type{Tree}, enode::EzXML.Node, dict=nothing)
    elements = filter(nodes(enode)) do n
        iselement(n) && return true
        istext(n) && !ismatch(r"^\s*$",nodecontent(n))
    end
    elements = collect(elements)
    tempnodes = map(elements) do e
        istext(e) ? Tree(nodecontent(e)) : convert(Tree,e,dict)
    end
    deletable = begin
        if any(istext, elements)
            false
        elseif dict == nothing || any(e -> haskey(dict,e), elements)
            true
        elseif any(n -> any(!isempty,n.children), tempnodes)
            true
        else
            false
        end
    end

    children = Tree[]
    for i = 1:length(elements)
        e = elements[i]
        t = tempnodes[i]
        if istext(e) || dict == nothing || haskey(dict,e)
            if isempty(children)
                push!(children, t)
            elseif isempty(t) && isempty(children[end])
                children[end].name *= t.name
            else
                push!(children, t)
            end
        elseif any(!isempty, t.children) || !deletable
            for c in t.children
                if isempty(children)
                    push!(children, c)
                elseif isempty(c) && isempty(children[end])
                    children[end].name *= c.name
                else
                    push!(children, c)
                end
            end
        end
    end
    Tree(nodename(enode), children)
end

function parse_front(front::EzXML.Node)
    xpath = """
        journal-meta/journal-title-group/journal-title
        | article-meta/title-group/article-title
        | article-meta/abstract
        """
    tree = Tree(nodename(front), map(parse_body,find(front,xpath)))

    contrib = "article-meta/contrib-group/contrib[@contrib-type=\"author\"]"
    xpath = """
        $contrib
        | $contrib/name/prefix
        | $contrib/name/given-names
        | $contrib/name/surname
        | $contrib/name/suffix
        | $contrib/collab
        """
    dict = Dict(n => n for n in find(front,xpath))
    authors = convert(Tree, front, dict).children
    foreach(a -> a.name = "author", authors)
    append!(tree, authors)
    tree
end

function parse_body(body::EzXML.Node)
    xpath = """
        //boxed-text
        | //boxed-text/label
        | //boxed-text/caption
        | //boxed-text/caption/title
        | //code
        | //def-list
        | //def-list/label
        | //def-list/title
        | //def-list/def-item
        | //def-list/def-item/term
        | //def-list/def-item/def
        | //disp-formula
        | //disp-formula//mml:math
        | //disp-formula//mml:math//*
        | //disp-formula/label
        | //disp-formula-group/label
        | //disp-formula-group/caption
        | //disp-formula-group/caption/title
        | //fig
        | //fig/label
        | //fig/caption
        | //fig/caption/title
        | //fig-group
        | //fig-group/label
        | //fig-group/caption
        | //fig-group/caption/title
        | //list
        | //list/label
        | //list/title
        | //list/list-item
        | //p
        | //sec
        | //sec/label
        | //sec/title
        | //statement
        | //statement/label
        | //statement/title
        | //table
        | //table/thead
        | //table/tbody
        | //table/tfoot
        | //table//tr
        | //table//th
        | //table//td
        | //table-wrap
        | //table-wrap/label
        | //table-wrap/caption
        | //table-wrap/caption/title
        | //table-wrap-group
        | //table-wrap-group/label
        | //table-wrap-group/caption
        | //table-wrap-group/caption/title
        """
    dict = Dict(n => n for n in find(body,xpath))
    convert(Tree, body, dict)
end

function parse_back(back::EzXML.Node)
    tree = Tree(nodename(back))
    for node in find(back, ".//element-citation | .//mixed-citation")
        setnodename!(node, "citation")
    end
    xpath = """
        ref-list
        | ref-list/label
        | ref-list/title
        | ref-list/ref
        | ref-list/ref/citation
        | ref-list/ref/citation/article-title
        | ref-list/ref/citation/name
        | ref-list/ref/citation/collab
        | ref-list/ref/citation/day
        | ref-list/ref/citation/month
        | ref-list/ref/citation/year
        | ref-list/ref/citation/fpage
        | ref-list/ref/citation/lpage
        | ref-list/ref/citation/issue
        | ref-list/ref/citation/pub-id
        | ref-list/ref/citation/publisher-loc
        | ref-list/ref/citation/publisher-name
        | ref-list/ref/citation/source
        | ref-list/ref/citation/edition
        | ref-list/ref/citation/volume
        """
    dict = Dict(n => n for n in find(back,xpath))
    convert(Tree, back, dict)
end

function findfloats(tree::Tree)
    floatset = Set(["boxed-text","code","fig","fig-group","table-wrap","table-wrap-group"])
    floats = Tree[]
    topdown_while(tree) do t
        if t.name in floatset
            push!(floats, t)
            false
        else
            true
        end
    end
    floats
end

function postprocess!(tree::Tree)
    # merge <label> with <title>
    for i = length(tree)-1:-1:1
        if tree[i].name == "label" && tree[i+1].name == "title"
            prepend!(tree[i+1], tree[i].children)
            deleteat!(tree, i)
        end
    end
    foreach(postprocess!, tree.children)
end
