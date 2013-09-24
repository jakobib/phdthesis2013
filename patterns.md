% Data Patterns

Chapter 5 of my thesis contains a pattern language of structures in data. The
20 patterns can be summarized as following (table 6.1, p. 226):

<a style="float:right"
   href="patterns/patterngraph.svg"><img src="patterns/patterngraph.svg" width="200px" /></a>

1.  **basic patterns**
    a)  pure data elements
        i.  [label](patterns/label.html)
        ii.  [atomicity](patterns/atomicity.html)

    b)  data elements with content
        i.  [size](patterns/size.html)
        i.  [optionality](patterns/optionality.html)
        i.  [prohibition](patterns/prohibition.html)

2.  **combining patterns**
    a)  combine multiple elements on the same level
        i.  [sequence](patterns/sequence.html)
        i.  [graph](patterns/graph.html)

    b)  combine elements by subsumption
        i.  [container](patterns/container.html)
        i.  [dependence](patterns/dependence.html)
        i.  [embedding](patterns/embedding.html)

3.  **relationing patterns**
    a)  primary
        i.  [identifier](patterns/identifier.html)
        i.  [derivation](patterns/derivation.html)

    b)  secondary
        i.  [encoding](patterns/encoding.html)
        i.  [flag](patterns/flag.html)

    c)  tertiary
        i.  [normalization](patterns/normalization.html)
        i.  [schema](patterns/schema.html)

4.  **continuing patterns**
    i.  [separator](patterns/separator.html)
    i.  [etcetera](patterns/etcetera.html)
    i.  [garbage](patterns/garbage.html)
    i.  [void](patterns/void.html)

The markdown source code of the pattern language is contained in a git
repository at <https://github.org/jakobib/datapatterns2013>.
