Adding stuff to this so that I can merge it back to master as I forgot to set up Dev branch earlier

#call this script from the command line with the following syntax:
#R --no-save <cript1.R --args seed=23978 out= out1.pdf
#if arguments are not given, the default behaviour is:
#seed - if not supplied, a new seed will be created using the current tie and the process ID
#out - fi not supplied the pdf generated will be saved to the file out1.pdf


library(tidyverse)
library(cowplot)
#get arguments
tmp <- commandArgs(TRUE)
#make a named list of arguments
lst <- strsplit(tmp, '=', fixed = TRUE) %>% sappley(`[`, 1)
#fill in defaults if not given
if(is.null(lst$out))
  lst$out <- 'out1.odf'
#set.seed(297834) # pick your own seed
#allow changing of random seed
if(!is.null(lst$seed))
  set.seed(as.numeric(lst$seed))
dat <- data_frame(pred = rnorm(100), resp = pred+ rnorm(100))
pdf('lst$out')
ggplot(dat, aes(pred, resp)) + geom_point()
dev.off()
