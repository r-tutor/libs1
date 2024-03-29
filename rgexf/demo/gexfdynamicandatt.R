################################################################################
# Demo of gexf function - Dynamic network with nodes and edges attributes 
# Author: Jorge Fabrega
################################################################################

pause <- function() {  
  invisible(readline("\nPress <return> to continue: ")) 
}

## Demos for rgexf - Nodes and edges with attributes.
## 1. A matrix of nodes 
## 2. A matrix of edges
## 3. A matrix of nodes attributes
## 4. A matrix of edges attributes
## 5. A matrix indicating the active period of each node 
## 6. A matrix indicating the active period of each edge

# Defining a matrix of nodes
pause()
people <- matrix(c(1:4, 'juan', 'pedro', 'matthew', 'carlos'),ncol=2)
people

# Defining a matrix of edges
pause()
relations <- matrix(c(1,4,1,2,1,3,2,3,3,4,4,2,2,4,4,1,4,1), ncol=2, byrow=T)
relations

# Defining two dataframes with attributes for nodes and edges, respectively.
pause()
node.att <- data.frame(attributes=c(letters[1:3],"a word"), numbers=1:4, stringsAsFactors=F)
node.att

edge.att <- data.frame(attributes=letters[1:9], numbers=1:9, stringsAsFactors=F)
edge.att

# Defining a matrix of dynamics (start, end) for nodes and edges
pause()
time.nodes<-matrix(c(10.0,13.0,2.0,2.0,12.0,rep(NA,3)), nrow=4, ncol=2)
time.edges<-matrix(c(10.0,13.0,2.0,2.0,12.0,1,5,rep(NA,5),rep(c(0,1),3)), ncol=2)

# In this example, the active period of each node is:
pause()
time.nodes

# And for the edges are:
time.edges

################################################################################
# Dynamic network with nodes and edges attributes

# you create a .gexf archive by adding the expression:
#
#                       ,output="yourgraph.gexf" 
#
# before the last closing 
# parenthesis in the following function

pause()
gexf(nodes=people, edges=relations, edgeDynamic=time.edges, edgesAtt=edge.att,
     nodeDynamic=time.nodes, nodesAtt=node.att)
