#libraries

library(rvest)
library(xml2)

#download files of 2014-2019 years

url <- "https://www.cbr.ru/publ/vestnik/year/2014/"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m14 <- matched[[1]][, 2][-103]
url <- "https://www.cbr.ru/publ/vestnik/year/2015/"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m15 <- matched[[1]][, 2][-c(112:118)]
url <- "https://www.cbr.ru/publ/vestnik/year/2016/"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m16 <- matched[[1]][, 2][-c(105:109)]
url <- "https://www.cbr.ru/publ/vestnik/year/2017/"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m17 <- matched[[1]][, 2][-99]
url <- "https://www.cbr.ru/publ/vestnik/year/2018/"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m18 <- matched[[1]][, 2][-87]
url <- "https://www.cbr.ru/publ/vestnik/year/2019/"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m19 <- matched[[1]][, 2][-39]

#unite all downloading urls* in one object 

M <- c(m14,m15, m16, m17, m18, m19)
M <- gsub("&amp;","&",M)

#download files in the directory folder

names <- c(1:539)
dat <- c(1:539)
for(i in 1:length(M)) {
  dat[i] = M[i]}
for (j in 1:539) {
  download.file(url = paste("https://www.cbr.ru", dat[j], sep = ""), destfile = paste("./vestnik",names[j] , ".pdf", sep = ""), mode = "wb")
}

#join pff files in one with pdftk

infiles <- Sys.glob("vestnik*.pdf") 
outfile <- "vestnik.pdf" 
system(paste("pdftk", paste(infiles, collapse = " "), "cat output", outfile))


#https://www.cbr.ru/Queries/XsltBlock/File/48351?fileId=-1&amp;scope=1595-1596
#https://www.cbr.ru/Queries/XsltBlock/File/48351?fileId=-1&scope=1595-1596