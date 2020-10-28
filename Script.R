setwd("/home/user/Documents/Sheena1/CG_TARGET_Analysis_sorting_table")

data1<-read.csv("gene_target_prediction_cg-norm-dot.txt",stringsAsFactors=FALSE,sep = '\t')
colnames(data1)
head(data1)

data1<-data1[
  order(data1["expt_id"], -data1["score"]),
]

summary(data1["score"])


## Extracting the 3 top score values per experiment

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



## Extracting the 10 top score values per experiment

expt_list<-list()
x<-0

for(i in 1:dim(unique(data1["expt_id"]))[1]){
    x<-x+1
    d<-data1[data1["expt_id"]==i,]
    expt_list[[x]]<-d[1:10,]
}

data_export_t10<-do.call(rbind, expt_list)

#write.table(data_export_t10, gzfile("gene_target_prediction_cg-norm-dot_sorted_top10.txt.gz") , append = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)

## extracting the characters before the first divider.
sub("\\_.*", "", data_export_t10[,3])


  [1] "YNL322C"   "YMR307W"   "YHR101C"   "YOR336W"   "YMR200W"   "YKL046C"  
  [7] "YNL243W"   "YDR182W"   "YGR229C"   "YOR085W"   "YNL322C"   "YMR307W"  
 [13] "YHR101C"   "YKL046C"   "YOR336W"   "YDR320C"   "YDR162C"   "YNL243W"  
 [19] "YMR200W"   "YFL025C"   "YNL322C"   "YKL046C"   "YDR162C"   "YMR307W"  
 [25] "YGR229C"   "YOR336W"   "YHR101C"   "YDL006W"   "YAL058W"   "YFL025C"  
 [31] "YKL046C"   "YNL322C"   "YDR162C"   "YAL058W"   "YGR229C"   "YGR166W"  
 [37] "YHR101C"   "YOR336W"   "YJL187C"   "YDL006W"   "YAL058W"   "YJL187C"  
 [43] "YGL027C"   "YOR336W"   "YOR387C"   "YBR229C"   "YMR147W"   "YJL187C"  
 [49] "YAL058W"   "YGL027C"   "YNL322C"   "YHR101C"   "YNL243W"   "YOR336W"  
 [55] "YMR307W"   "YMR200W"   "YER151C"   "YKL046C"   "YBR288C"   "YOR085W"  
 [61] "YNL322C"   "YOR336W"   "YMR200W"   "YHR101C"   "YMR307W"   "YKL046C"  
 [67] "YNL243W"   "YOR085W"   "YDR524W-C" "YAL058W"   "YKL046C"   "YNL322C"  
 [73] "YHR101C"   "YOR336W"   "YDR162C"   "YAL058W"   "YNL323W"   "YMR307W"  
 [79] "YDL006W"   "YJL139C"   "YAL058W"   "YJL187C"   "YJL187C"   "YBR229C"  
 [85] "YAL058W"   "YLR324W"   "YAL012W"   "YIR026C"   "YOL161C"   "YOR336W"  
 [91] "YAL058W"   "YJL187C"   "YGR196C"   "YHR030C"   "YLR459W"   "YIR026C"  
 [97] "YOL161C"   "YLR324W"   "YAL058W"   "YBR229C"   "YAL023C"   "YLR066W"  
[103] "YDR437W"   "YOL013C"   "YPL076W"   "YPL076W"   "YML055W"   "YMR264W"  
[109] "YDL193W"   "YPL096C-A" "YBL041W"   "YOR259C"   "YOR117W"   "YER094C"  
[115] "YGL011C"   "YGL048C"   "YOR362C"   "YGR253C"   "YFR050C"   "YDL007W"  
[121] "YML124C"   "YLR200W"   "YNL153C"   "YEL003W"   "YML094W"   "YOR349W"  
[127] "YGR078C"   "YDL028C"   "YBL034C"   "YER007W"   "YOR144C"   "YKL113C"  
[133] "YDL102W"   "YOR217W"   "YDL102W"   "YKL045W"   "YCL061C"   "YNL262W"  
[139] "YJR043C"   "YOR080W"   "YBR063C"   "YDR248C"   "YPR131C"   "YLR439W"  
[145] "YBR162W-A" "YPL277C"   "YMR041C"   "YEL070W"   "YLR231C"   "YOR174W"  
[151] "YPL023C"   "YJL143W"   "YER012W"   "YHR083W"   "YML035C"   "YGR234W"  
[157] "YER077C"   "YNL200C"   "YBR055C"   "YHR033W"   "YBL080C"   "YBR139W"  
[163] "YOL052C"   "YML125C"   "YOL112W"   "YMR182C"   "YBL101C"   "YNL200C"  
[169] "YDR192C"   "YBR200W-A" "YKL061W"   "YHL025W"   "YML097C"   "YPR074C"  
[175] "YBR123C"   "YIL069C"   "YPL016W"   "YNL178W"   "YMR023C"   "YKL035W"  
[181] "YMR266W"   "YDR266C"   "YPL203W"   "YNR022C"   "YHR216W"   "YLR401C"  
[187] "YLR353W"   "YPL171C"   "YGL215W"   "YOR030W"   "YJL061W"   "YOR096W"  
[193] "YNL066W"   "YFL014W"   "YMR126C"   "YBR227C"   "YHR072W"   "YNL242W"  
[199] "YLR043C"   "YML129C"   "YDR052C"   "YGL141W"   "YOL055C"   "YOR268C"  
[205] "YFL007W"   "YPL192C"   "YBR260C"   "YMR010W"   "YPR054W"   "YLR092W"  
[211] "YFR040W"   "YML082W"   "YKR081C"   "YAL062W"   "YDR221W"   "YBL081W"  
[217] "YNL227C"   "YJR107W"   "YMR017W"   "YBR043C"   "YIL139C"   "YKL114C"  
[223] "YKL224C"   "YAL046C"   "YBR004C"   "YOR111W"   "YBR014C"   "YIR010W"  
[229] "YGR260W"   "YIR010W"   "YNL151C"   "YHR097C"   "YER162C"   "YCR007C"  
[235] "YER186C"   "YDR147W"   "YCL047C"   "YFR017C"   "YDR444W"   "YNR013C"

## this was cleaned in a notepad and pasted in the convert gene names tool of boonelab website.
## This produced the file: GeneConversion_2020-10-26_14-31-46.xls
## A csv file was produced out of it and opened here:

data2<-read.csv("GeneConversion_2020-10-28_11-55-45_top10.csv",stringsAsFactors=FALSE,sep = '\t')

data_export_2<-cbind(data_export_t10,data2)



write.table(data_export_2, gzfile("gene_target_prediction_cg-norm-dot_sorted_top10_genenames.txt.gz") , append = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)

