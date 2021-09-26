# sunburstR 2.1.6

* add labels for slices based on https://bl.ocks.org/vasturiano/12da9071095fbd4df434e60d52d2d58d

# sunburstR 2.1.5

* fix bug in internal `csv_to_hier` converter; (see [issue 107](https://github.com/timelyportfolio/sunburstR/issues/107))

# sunburstR 2.1.4

* add showLabels argument to d2b; (see [issue 71](https://github.com/timelyportfolio/sunburstR/issues/71))

# sunburstR 2.1.3

* add breadcrumb customization to d2b; (see [issue 92](https://github.com/timelyportfolio/sunburstR/issues/92))
* add argument to allow user to change root label (see [issue 96](https://github.com/timelyportfolio/sunburstR/issues/96))

# sunburstR 2.1.2

* add tooltip customization to d2b; (see [issue 92](https://github.com/timelyportfolio/sunburstR/issues/92))

# sunburstR 2.1.1

* add Shiny to d2b; (see [issue 64](https://github.com/timelyportfolio/sunburstR/issues/64))

# sunburstR 2.1.0

* update d2b so that pre-summed trees correctly handled; (see [issue 78](https://github.com/timelyportfolio/sunburstR/issues/78) and [issue 62](https://github.com/timelyportfolio/sunburstR/issues/62))

# sunburstR 2.0.0

* add `sumNodes` argument to correctly handle pre-summed trees, like `treemap::treemap` to not double count the aggregate (see [issue](https://github.com/timelyportfolio/sunburstR/issues/62))

* add `sund2b()` htmlwidget for a [d2b](http://www.d2bjs.org/) sunburst chart

* allow turning off the legend with argument `legend = FALSE` (see [issue](https://github.com/timelyportfolio/sunburstR/issues/61))

* fix bug to not duplicate svg for breadcrumbs on resize or re-render

# sunburstR 1.0.3

* change text color in legend and breadcrumb to white or black for legibility using d3plus

# sunburstR 1.0.2

* changes required in downstream d3r to work with new tidyr (0.7.0), so now working and tested

# sunburstR 1.0.1

* improve internal `csv_to_hier()` with delimiter argument and smart convert for root level

# sunburstR 1.0.0

see [sunburstR v1 Github Project](https://github.com/timelyportfolio/sunburstR/projects/1)

### Updates

* update to `d3v4`; thanks @cjyetman (see [issue 36](https://github.com/timelyportfolio/sunburstR/issues/36))
* convert JS to standalone build to prevent conflicts with other non-d3v4 htmlwidgets (see [issue 40](https://github.com/timelyportfolio/sunburstR/issues/40))
* begin to modularize JavaScript (see [issue 37](https://github.com/timelyportfolio/sunburstR/issues/37))


### API Changes

* **BREAKING** `csvdata` and `jsondata` deprecated in favor of single data argument (see [issue 43](https://github.com/timelyportfolio/sunburstR/issues/43))
* add `dplyr` to IMPORTS
* convert csv hierarchy on the R side instead of JS side;  slightly slower but will work to improve

# sunburstR 0.6.5

### Bug Fix

* fix legend bug introduced with new color functionality; see [issue](https://github.com/timelyportfolio/sunburstR/issues/34) and [commit](https://github.com/timelyportfolio/sunburstR/commit/635ec7cd755d8d3ae417a402be65833725551cdf)

# sunburstR 0.6.4

see [treemap example](https://github.com/timelyportfolio/sunburstR/blob/master/inst/examples/example_treemap.R)

* add `valueField` argument to `sunburst()` to allow fields in json
    to be something other than `"size"` [commit](https://github.com/timelyportfolio/sunburstR/commit/52bfc78cbfb1a8083584370aace863b674b53e32)
* add ability to supply a JavaScript `function` to `colors` for
    advanced color customization or to use a color field from data
    as the color fill [commit](https://github.com/timelyportfolio/sunburstR/commit/4499a7c2bd5e57b729fbe2c562f1ef9932143f10)

# sunburstR 0.6.3

### Updates

* use the new CRAN package `d3r` for `d3.js` dependencies

# sunburstR 0.6.2

### Updates

* update d3.js to most recent tagged v3 release [commit](https://github.com/timelyportfolio/sunburstR/commit/5af0b29f08fad5e9ea8e28fb2c4e6eb9f09d1887)

# sunburstR 0.6.1

### New Features

* add click to dispatch for click event handling [commit](https://github.com/timelyportfolio/sunburstR/commit/d3239b42f7dc29dcbe9456523bccd601e25f0a20)
* add click to `add_shiny` and provide examples [commit](https://github.com/timelyportfolio/sunburstR/commit/d3239b42f7dc29dcbe9456523bccd601e25f0a20) and [commit](https://github.com/timelyportfolio/sunburstR/commit/4f72b6e9c12d23ff24f40828747ccbdce9ce075b)

### Bug Fix

* try to fix breadcrumb sizing bug for Firefox, Safari [commit](https://github.com/timelyportfolio/sunburstR/pull/24/commits/d3239b42f7dc29dcbe9456523bccd601e25f0a20)


# sunburstR 0.6

* CRAN release



