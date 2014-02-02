% Categorization of Data Structuring Methods 

Many methods, technologies, standards, and languages exist to structure and
describe data. The aim of PhD my thesis was to find common features in these
methods to determine how data is actually structured and described. One result
of the analysis is a **categorization of data structuring methods** (included
as section 4.1).

# How the methods have been categorized

The categorization is introduced with a quote:

> Notoriamente no hay clasificación del universo que no sea arbitraria y 
> conjetural. La razón es muy simple: no sabemos qué cosa es el universo.
> --- Jorge Luis Borges (1952)

Given the number and variety of data structuring methods one can categorize
them by history and origin, by type of application, by complexity, and by many
other criteria. This approach, however, can result in rather arbitrary
classifications, because a single facet has to be chosen and because most
facets are not selective for all instances. Another approach, that better fits
to how people cognitively perceive and classify things, is grouping based on
prototypes which act as cognitive reference points (Lakoff 1987; Rosch1983).
Following this approach, categories of data structuring methods are not defined
by selected features, but data structuring methods are clustered by similarity,
until prototypical methods emerge. A can act as good example of a certain
category, while other instances belonging to this category are less central.
For instance in western society, a chair is a central prototype of furniture,
although other furniture may share little properties with chairs.

# The categorization

The final prototype categorization of data structuring methods (originally
given in table 4.1 of the thesis) lists each category with its *main purpose*
and some examples:

encodings
  : primarily *express data* (Unicode, Base64,...)
storage systems 
  : primarily *store data* (NTFS, RDBMS, ...)
identifier and query languages
  : primarily *refer to data* (URI, XPath, ...)
structuring and markup languages
  : primarily *structure data* (XML, CSV, RDF, ...)
schema languages
  : primarily *constrain data* (BNF, XSD, OWL...)
conceptual models
  : primarily *describe data* (Mind Maps, ERM, ...)

The main purpose was chosen as dividing facet because is is independent from
particular use cases and applications. In short, a main purpose tells what a
particular method mainly does with data. For instance the main purpose of
storage systems like databases and file systems is storage. The data
structuring method’s main purpose can act as guideline to find the nearest
prototype from the categorization. Still this dividing facet should not be
confused with a strict classifier as known from more formal approaches of
categorization. Instances from each category can also serve multiple purposes,
just like one can use a chair not only as furniture for sitting but also to
stand on it when changing a light bulb or giving a speech. To give an example,
the OWL schema language is based on ERM, so it can also be used for conceptual
modeling, but it's main purpose is putting formal constrains and rules on RDF
data.

# A broad view on data

The categorization of data structuring methods gives a very broad view on data.
On the other end of granularity of description there is the [pattern
language of structures in data](patterns.html).
