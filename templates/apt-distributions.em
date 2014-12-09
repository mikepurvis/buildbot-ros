@[for dist in dists]@
Origin: @name
Label: @name @dist
Codename: @dist
Architectures: @(' '.join(arches))
Components: main
Description: @name Debian Repository
@[if key]@
SignWith: @key
@[end if]@

@[end for]@
