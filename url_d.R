#libraries

library(rvest)
library(xml2)

#download files of 2014-2019 years

url <- "https://www.my_url"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m14 <- matched[[1]][, 2][-103]
url <- "https://www.my_url"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m15 <- matched[[1]][, 2][-c(112:118)]
url <- "https://www.my_url"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m16 <- matched[[1]][, 2][-c(105:109)]
url <- "https://www.my_url"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m17 <- matched[[1]][, 2][-99]
url <- "https://www.my_url"
html <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a target=\"_blank\" href=\"(.*?)\">")
m18 <- matched[[1]][, 2][-87]
url <- "https://www.my_url"
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
  download.file(url = paste("https://my_url", dat[j], sep = ""), destfile = paste("./vestnik",names[j] , ".pdf", sep = ""), mode = "wb")
}

#join pff files in one with pdftk

infiles <- Sys.glob("vestnik*.pdf") 
outfile <- "vestnik.pdf" 
system(paste("pdftk", paste(infiles, collapse = " "), "cat output", outfile))
