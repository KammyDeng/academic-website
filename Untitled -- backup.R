To creat the graph is basically to use `qgraph()`, such as:
  
  ```{r cor big5}
qgraph<-qgraph(cor(big5))
```


But it should be noted that the input in the `qgraph()` can be a weight matrix or an edgelist.

Thus, if you want to creat the association network, `cor()`/`cor_auto()` can be used to creat the matrix first.

Also, you can use `groups` to indicate which nodes belong together, such as:
  
  ```{r groups big5}
data("big5groups")
qgraph(cor(big5), groups=big5groups)
```

Besides, you can use some additional arguments to customize your representing graph.

you can use `layout` to change the representation, such as:
  
  ```{r layout big5}
qgraph(cor(big5), groups=big5groups,layout= "spring")
```

```{r layout2 big5}
qgraph(cor(big5), groups=big5groups,layout= "circle")
```

Moreover, you can use `palette` and `theme` to change the colour of nodes.

Notes: the palette used for colouring nodes when using `groups` argument.

For example:
  
  ```{r pa big5}
qgraph(cor(big5), groups=big5groups,palette="colorblind")
```


More specifically, there are several optional graphical arguments to change the graph representation, such as `minizum` (to omit correlations not interested in), `borders`(to omit borders around the nodes), `vsize`(to change the size of nodes) and `legend`(to control the legend placed on the right side).

For example:
  
  ```{r additional big5}
qgraph(cor(big5), groups=big5groups,layout="spring",minimum=0.35,vsize=3,legend=TRUE,borders=FALSE)
```


In addition, there are some options for correlation or covariance matrices to make the graph. You can use `graph` to change the type of graph.

For example, if you want to plot a partial correlation network, you can use `graph="pcor` to make it.

```{r graph big5}
qgraph(cor(big5), groups=big5groups,layout="spring",minimum=0.35,vsize=3,legend=TRUE,borders=FALSE,graph="pcor")
```

Finally, if you decide the representation of the graph, you can choose to use `ﬁletype`(pdf/jpg/tex etc.) to save your graph.


### How to calculate the centrality indices

After estimating the graph, you can calculate the centrality indices using `centralityPlot` to quantify the structural importance of each node in the network.

Then, you will get this figure.

```{r centrality big5,echo=FALSE}
centralityPlot(qgraph)
```


## Estimating the accuracy of networks

Like many psychometrics analysis, the accuracy of psychological network is also limited to sample size. The limited sample size might restrict the accuracy of the parameters and the interpretation of the network. Thus, it’s necessary and crucial to assess the accuracy of the network parameters and measures. 

In order to estimate the accuracy of the networks estimation, three steps to evaluate the stability of the network routinely were conducted using `bootnet` package [(Epskamp, Borsboom & Fried, 2018)](https://link.springer.com/article/10.3758/s13428-017-0862-1)

In addition to use `qgraph` to create the graph, you can also use `estimateNetwork` to estimate the network structure as well.

To get the data:
  
  ```{r newdata}
library(psych)
data("bfi")
bfisub<-bfi[1:100,1:25]
```


```{r network}
library(bootnet)
Network <- estimateNetwork(bfisub, default = "cor")
plot(Network, layout = 'spring')
```

Here is three steps to conduct the accuracy estimation.

Firstly, the accuracy of edge-weights can be estimated by drawing bootstrapped CIs. 

```{r edge-weight}
Results1 <- bootnet(Network, nBoots = 1000, nCores = 8)
plot(Results1, labels = FALSE, order = "sample")
```

Secondly, the stability of centrality indices can be investigated after observation only portions of the data. 

```{r centrality}
Results2 <- bootnet(Network, nBoots = 1000, nCores = 8, type = "case")
plot(Results2)
```

Lastly, the bootstrapped differences between edge-weights and centrality indices to test whether these differ significantly from each other can be carried out.

```{r diffedge}
plot(Results1, "edge", plot = "difference",onlyNonZero = TRUE, order = "sample")
```

```{r diffstrength}
plot(Results1, "strength", plot = "difference")
```


To creat the graph is basically to use `qgraph()`, such as:
  
  ```{r cor big5}
qgraph<-qgraph(cor(big5))
```


But it should be noted that the input in the `qgraph()` can be a weight matrix or an edgelist.

Thus, if you want to creat the association network, `cor()`/`cor_auto()` can be used to creat the matrix first.

Also, you can use `groups` to indicate which nodes belong together, such as:
  
  ```{r groups big5}
data("big5groups")
qgraph(cor(big5), groups=big5groups)
```

Besides, you can use some additional arguments to customize your representing graph.

you can use `layout` to change the representation, such as:
  
  ```{r layout big5}
qgraph(cor(big5), groups=big5groups,layout= "spring")
```

```{r layout2 big5}
qgraph(cor(big5), groups=big5groups,layout= "circle")
```





## Including Plots

You can also embed plots, for example:
  
  ```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.


To creat the graph is basically to use `qgraph()`, such as:
  
  ```{r cor big5}
qgraph<-qgraph(cor(big5))
```


But it should be noted that the input in the `qgraph()` can be a weight matrix or an edgelist.

Thus, if you want to creat the association network, `cor()`/`cor_auto()` can be used to creat the matrix first.

Also, you can use `groups` to indicate which nodes belong together, such as:
  
  ```{r groups big5}
data("big5groups")
qgraph(cor(big5), groups=big5groups)
```

Besides, you can use some additional arguments to customize your representing graph.

you can use `layout` to change the representation, such as:
  
  ```{r layout big5}
qgraph(cor(big5), groups=big5groups,layout= "spring")
```

```{r layout2 big5}
qgraph(cor(big5), groups=big5groups,layout= "circle")
```

Moreover, you can use `palette` and `theme` to change the colour of nodes.

Notes: the palette used for colouring nodes when using `groups` argument.

For example:
  
  ```{r pa big5}
qgraph(cor(big5), groups=big5groups,palette="colorblind")
```


More specifically, there are several optional graphical arguments to change the graph representation, such as `minizum` (to omit correlations not interested in), `borders`(to omit borders around the nodes), `vsize`(to change the size of nodes) and `legend`(to control the legend placed on the right side).

For example:
  
  ```{r additional big5}
qgraph(cor(big5), groups=big5groups,layout="spring",minimum=0.35,vsize=3,legend=TRUE,borders=FALSE)
```


In addition, there are some options for correlation or covariance matrices to make the graph. You can use `graph` to change the type of graph.

For example, if you want to plot a partial correlation network, you can use `graph="pcor` to make it.

```{r graph big5}
qgraph(cor(big5), groups=big5groups,layout="spring",minimum=0.35,vsize=3,legend=TRUE,borders=FALSE,graph="pcor")
```

Finally, if you decide the representation of the graph, you can choose to use `ﬁletype`(pdf/jpg/tex etc.) to save your graph.


### How to calculate the centrality indices

After estimating the graph, you can calculate the centrality indices using `centralityPlot` to quantify the structural importance of each node in the network.

Then, you will get this figure.

```{r centrality big5,echo=FALSE}
centralityPlot(qgraph)
```


## Estimating the accuracy of networks

Like many psychometrics analysis, the accuracy of psychological network is also limited to sample size. The limited sample size might restrict the accuracy of the parameters and the interpretation of the network. Thus, it’s necessary and crucial to assess the accuracy of the network parameters and measures. 

In order to estimate the accuracy of the networks estimation, three steps to evaluate the stability of the network routinely were conducted using `bootnet` package [(Epskamp, Borsboom & Fried, 2018)](https://link.springer.com/article/10.3758/s13428-017-0862-1)

In addition to use `qgraph` to create the graph, you can also use `estimateNetwork` to estimate the network structure as well.

To get the data:
  
  ```{r newdata}
library(psych)
data("bfi")
bfisub<-bfi[1:100,1:25]
```


```{r network}
library(bootnet)
Network <- estimateNetwork(bfisub, default = "cor")
plot(Network, layout = 'spring')
```

Here is three steps to conduct the accuracy estimation.

Firstly, the accuracy of edge-weights can be estimated by drawing bootstrapped CIs. 

```{r edge-weight}
Results1 <- bootnet(Network, nBoots = 1000, nCores = 8)
plot(Results1, labels = FALSE, order = "sample")
```

Secondly, the stability of centrality indices can be investigated after observation only portions of the data. 

```{r centrality}
Results2 <- bootnet(Network, nBoots = 1000, nCores = 8, type = "case")
plot(Results2)
```

Lastly, the bootstrapped differences between edge-weights and centrality indices to test whether these differ significantly from each other can be carried out.

```{r diffedge}
plot(Results1, "edge", plot = "difference",onlyNonZero = TRUE, order = "sample")
```

```{r diffstrength}
plot(Results1, "strength", plot = "difference")
```




