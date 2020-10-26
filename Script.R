data1<-read.csv("gene_target_prediction_cg-norm-dot.txt",stringsAsFactors=FALSE,sep = '\t')
colnames(data1)
head(data1)

data1<-data1[
  order(data1["expt_id"], -data1["score"]),
]

summary(data1["score"])

expt_list<-list()
x<-0

for(i in 1:dim(unique(data1["expt_id"]))[1]){
    x<-x+1
    d<-data1[data1["expt_id"]==i,]
    expt_list[[x]]<-d[1:3,]
}

data_export<-do.call(rbind, expt_list)

write.table(data_export, gzfile("gene_target_prediction_cg-norm-dot_sorted_top3.txt.gz") , append = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)

## extracting the characters before the first divider.
sub("\\_.*", "", data_export[,3])


 [1] "YNL322C" "YMR307W" "YHR101C" "YNL322C" "YMR307W" "YHR101C" "YNL322C"
 [8] "YKL046C" "YDR162C" "YKL046C" "YNL322C" "YDR162C" "YAL058W" "YJL187C"
[15] "YGL027C" "YNL322C" "YHR101C" "YNL243W" "YNL322C" "YOR336W" "YMR200W"
[22] "YKL046C" "YNL322C" "YHR101C" "YAL058W" "YJL187C" "YJL187C" "YAL058W"
[29] "YJL187C" "YGR196C" "YAL023C" "YLR066W" "YDR437W" "YBL041W" "YOR259C"
[36] "YOR117W" "YML124C" "YLR200W" "YNL153C" "YOR144C" "YKL113C" "YDL102W"
[43] "YBR063C" "YDR248C" "YPR131C" "YPL023C" "YJL143W" "YER012W" "YBL080C"
[50] "YBR139W" "YOL052C" "YKL061W" "YHL025W" "YML097C" "YMR266W" "YDR266C"
[57] "YPL203W" "YJL061W" "YOR096W" "YNL066W" "YDR052C" "YGL141W" "YOL055C"
[64] "YFR040W" "YML082W" "YKR081C" "YIL139C" "YKL114C" "YKL224C" "YNL151C"
[71] "YHR097C" "YER162C"

## this was cleaned in a notepad and pasted in the convert gene names tool of boonelab website.
## This produced the file: GeneConversion_2020-10-26_14-31-46.xls
## A csv file was produced out of it and opened here:

data2<-read.csv("GeneConversion_2020-10-26_14-31-46.csv",stringsAsFactors=FALSE,sep = '\t')

data_export_2<-cbind(data_export,data2)



write.table(data_export_2, gzfile("gene_target_prediction_cg-norm-dot_sorted_top3_genenames.txt.gz") , append = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)


