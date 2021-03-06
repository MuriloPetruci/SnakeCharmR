% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/py.get.R
\name{py.get}
\alias{py.get}
\title{Get values from Python variables to R}
\usage{
py.get(var.name, json.opt.ret = getOption("SnakeCharmR.json.opt.ret",
  list()))
}
\arguments{
\item{var.name}{a character string containing a valid Python variable name}

\item{json.opt.ret}{explicit arguments to pass to \code{jsonlite::fromJSON} 
when deserializing the value}
}
\value{
an R object containing the variable value after serialization to JSON
in the Python environment and deserialization from JSON in the R environment
}
\description{
\code{py.get} get the value of Python and returns it to the R environment.
Objects are serialized as JSON strings on Python with \code{json.dumps},
are transferred to R and are converted back to an R value using
\code{jsonlite::fromJSON}.
}
\examples{
py.assign("a", 1:4)
py.get("a")
# [1] 1 2 3 4

py.assign("b", list(one = 1, foo = "bar"))
str(py.get("b"))
# List of 2
#  $ foo: chr "bar"
#  $ one: int 1

py.exec("import math")
py.get("math.pi")
# [1] 3.141593

\dontrun{
py.rm("notset")
py.get("notset")
# Error in py.get("notset") (from py.get.R#60) : Traceback (most recent call last):
#   File "<string>", line 2, in <module>
# NameError: name 'notset' is not defined
}
}
