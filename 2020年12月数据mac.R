


setwd("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月")
getwd()

library(readxl)
library(dplyr)
library(openxlsx)
library(lubridate)
library(tidyverse)  #
rm(list=ls())

#-----2020年12月死亡数据库导入-------------class(ndeath113)

ndeath101n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月101(非沪籍).xls")
ndeath104n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月104(非沪籍).xlsx")
ndeath105n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览表表12月105（非沪籍）.xls")
ndeath106n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月106（非沪籍).xls")
ndeath107n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月107（非沪籍）.xls")
ndeath109n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月109（非沪籍）.xlsx")
ndeath110n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月110（非沪籍）.xls")
ndeath112n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月112(非沪籍).xls")
ndeath113n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月113（非沪籍）.xls")
ndeath114n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月114（非沪籍）.xls")
ndeath115n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月115（非沪籍）.xlsx")
ndeath116n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月116（非沪籍）.xls")
ndeath117n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月117（非沪籍）.xls")
ndeath118n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月118（非沪籍）.xlsx")
ndeath120n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月120（非沪籍）.xls")
ndeath151n12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月151（非沪籍）.xls")



cols<-c('死亡证编号','报卡编号','报卡类型编码','报卡类型','姓名','性别编码','性别',
        '民族编码','民族','其他民族','证件类型','证件号码','婚姻状况编码',
        '婚姻状况','文化程度编码','文化程度','国籍','主要职业编码',
        '主要职业','就业状况编码','就业状况','是否婴幼儿编码','是否婴幼儿',
        '是否弱智编码','是否弱智','出生日期','死亡日期','实足年龄',
        '年龄单位','死亡地点类别代码','死亡地点类别名称','是否处于妊娠期',
        '联系人姓名','联系人电话','联系人地址','户籍地-省（自治区、直辖市）',
        '户籍地-市（地区）','户籍地-县（区）','户籍地-乡（镇、街道）',
        '户籍地-居委会、村','户籍地-村（路、街、弄）','户籍地-门牌号(包括“室")',
        '户籍地址补充信息','户籍地址','户籍街道编码','居住地-省（自治区、直辖市）',
        '居住地-市（地区）','居住地-县（区）','居住地-乡（镇、街道）',
        '居住地-居委会、村','居住地-村（路、街、弄）','居住地-门牌号(包括“室")',
        '居住地址补充信息','居住地址','居住街道编码','直接死亡原因名称a',
        '直接死亡原因编码a','发病日期a','直接死亡原因名称b','直接死亡原因编码b',
        '发病日期b','直接死亡原因名称c','直接死亡原因编码c','发病日期c',
        '直接死亡原因名称d','直接死亡原因编码d','发病日期d','其他疾病诊断名称1',
        '其他疾病诊断代码1','其他疾病诊断名称2','其他疾病诊断代码2',
        '其他疾病诊断名称3','其他疾病诊断代码3','死亡医院名称','死亡医院代码',
        '住院号','疾病的最高诊断医院名称','疾病的最高诊断医院代码',
        '死亡最高诊断依据类别编码','死亡最高诊断依据类别',
        '主要致死疾病的最高诊断机构级别编码','主要致死疾病的最高诊断机构级别',
        '根本死因代码','根本死因名称','规则','死者生前病史及症状体征','被调查者姓名',
        '被调查者与死者关系','被调查者联系电话','被调查者工作单位','被调查者联系地址',
        '死因推断','调查者姓名','调查日期','申办人姓名','申办人与死者关系',
        '申办人联系电话','申办人工作单位','申办人联系地址','推断者姓名','推断日期',
        '死亡确认单位','死亡确认者','死亡确认日期','死亡确认依据',
        '尸表（尸解）检验记录','报告单位代码','报告单位','报告者姓名','报告日期',
        '录入单位','录入医生姓名','录入日期','修改单位','修改者姓名','修改日期',
        '核重标志','是否删除','统计日期','户籍区分编码','户籍区分','区疾控审核状态',
        '区县疾控审核人','统计分类号','是否五岁以下儿童','出生孕周','出生体重（g）',
        '出生地点','有无畸形','畸形种类名称','畸形种类ICD编码','母亲姓名',
        '母亲出生日期','父亲姓名','父亲出生日期','父母居住地址',
        '父母居住地址补充信息','父母户籍地址','父母户籍地址补充信息',
        '既往活产次数（分娩活产婴儿的例数）','既往死胎例数（分娩死胎的例数）',
        '既往死产例数','既往流产次数','前次妊娠结局','前次妊娠日期','审核区县')


                   

colnames(ndeath101n12) <- cols
colnames(ndeath104n12) <- cols
colnames(ndeath105n12) <- cols
colnames(ndeath106n12) <- cols
colnames(ndeath107n12) <- cols
colnames(ndeath109n12) <- cols
colnames(ndeath110n12) <- cols
colnames(ndeath112n12) <- cols
colnames(ndeath113n12) <- cols
colnames(ndeath114n12) <- cols
colnames(ndeath115n12) <- cols
colnames(ndeath116n12) <- cols
colnames(ndeath117n12) <- cols
colnames(ndeath118n12) <- cols
colnames(ndeath120n12) <- cols
colnames(ndeath151n12) <- cols

table(Totaldeath12$x20,Totaldeath12$x21)
totalsepn12<-rbind(ndeath101n12,ndeath104n12,ndeath105n12,ndeath106n12,
                  ndeath107n12,ndeath109n12,ndeath110n12,ndeath112n12,
                  ndeath113n12,ndeath114n12,ndeath116n12,ndeath115n12,
                  ndeath117n12,ndeath118n12,ndeath120n12,ndeath151n12)

death101h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月101(沪籍）.xls",col_types ="text")
death104h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月104(沪籍).xlsx",col_types ="text")
death105h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览表表12月105（沪籍）.xlsx",col_types ="text")
death106h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月106（沪籍）.xls",col_types ="text")
death107h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月107（沪籍）.xls",col_types ="text")
death109h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月109（沪籍）.xlsx",col_types ="text")
death110h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月110（沪籍）.xls",col_types ="text")
death112h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月112(沪籍).xls",col_types ="text")
death112h12ne<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月112(沪籍)（不含儿福院）.xlsx",col_types ="text")

death113h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月113（沪籍）.xls",col_types ="text")
death114h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月114（沪籍）.xls",col_types ="text")
death115h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月115（沪籍）.xlsx",col_types ="text")
death116h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月116（沪籍）.xls",col_types ="text")
death117h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月117（沪籍）.xls",col_types ="text")
death118h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月118（沪籍）.xlsx",col_types ="text")
death120h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月120（沪籍）.xls",col_types ="text")
death151h12<-read_excel("/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/死亡报告卡一览列表12月151（沪籍）.xls",col_types ="text")

colnames(death101h12) <- cols
colnames(death104h12) <- cols
colnames(death105h12) <- cols
colnames(death106h12) <- cols
colnames(death107h12) <- cols
colnames(death109h12) <- cols
colnames(death110h12) <- cols
colnames(death112h12) <- cols
colnames(death112h12ne) <- cols
colnames(death113h12) <- cols
colnames(death114h12) <- cols
colnames(death115h12) <- cols
colnames(death116h12) <- cols
colnames(death117h12) <- cols
colnames(death118h12) <- cols
colnames(death120h12) <- cols
colnames(death151h12) <- cols



totalseph12ne<-rbind(death101h12,death104h12,death105h12,death106h12,
                   death107h12,death109h12,death110h12,death112h12ne,                  
                   death113h12,death115h12,death117h12,death118h12,
                   death151h12,death114h12,death116h12,death120h12)
totalseph12<-rbind(death101h12,death104h12,death105h12,death106h12,
                     death107h12,death109h12,death110h12,death112h12,                 
                     death113h12,death115h12,death117h12,death118h12,
                     death151h12,death114h12,death116h12,death120h12)

#write.xlsx(totalseph12ne,"2020年12月沪籍死亡数据(不含儿福院).xlsx")
#write.xlsx(totalseph12,"2020年12月沪籍死亡数据(含儿福院).xlsx")
#write.xlsx(totalsepn12,"2020年12月非沪籍死亡数据.xlsx")


totalseph12$死亡日期<-lubridate::ymd(totalseph12$死亡日期)
totalseph12$出生日期<-lubridate::ymd(totalseph12$出生日期)
totalsepn12$死亡日期<-lubridate::ymd(totalsepn12$死亡日期)
totalsepn12$出生日期<-lubridate::ymd(totalsepn12$出生日期)



#totalseph122020<-subset(totalseph12,totalseph12$deathyear=="2020")

#------------计算环境内有多少对象----------------------------
temp<-ls(pattern = "*death*")
Chen<-data.frame()
Lei<-data.frame()
for (i in temp){
  text=paste0("nrow(",i,")")
  Chen[1,"table"]<-i
  Chen[1,"number"]<-eval(parse(text = text))
  Lei<-rbind(Chen,Lei)
}
Lei

#------------合并数据库----------------------------

Totaldeath12<-rbind(totalseph12,totalsepn12)
Totaldeath12$根本死因代码<-toupper(Totaldeath12$根本死因代码)
rm(list=ls(pattern="death"))
Totaldeath12<-rbind(totalseph12,totalsepn12)
Totaldeath12$根本死因代码<-toupper(Totaldeath12$根本死因代码)

names_death <- names(Totaldeath12)
names(Totaldeath12) <- paste0('x', 1 : ncol(Totaldeath12))

#------------儿童福利院死亡----------------
erfu<-Totaldeath12 %>%  filter(grepl("中春路",x44),grepl("9977",x44)) #儿童福利院死亡
   
#--------计算年龄---------------
library(lubridate)



 calage <- function(birth,death){
  i <- lubridate::interval(birth,death)
  p <- lubridate::as.period(i)
  lubridate::year(p)
}


calagem <- function(birth,death){
  i <- lubridate::interval(birth,death)
  p <- lubridate::as.period(i)
  lubridate::month(p)
}

calaged <- function(birth,death){
  i <- lubridate::interval(birth,death)
  p <- lubridate::as.period(i)
  lubridate::day(p)
}

Totaldeath12$agea<-calage(Totaldeath12$x26,Totaldeath12$x27)




#--------年龄组---------------
library(data.table)

agebreaks1 <- c(0,1,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,500)
agelabels1 <- c("0~","1~","5~","10~","15~","20~","25~","30~",
                "35~","40~","45~","50~","55~","60~","65~",
                "70~","75~","80~","85~")

setDT(Totaldeath12)[,agegroups1 := cut(agea, 
                                      breaks = agebreaks1, 
                                      right = FALSE, 
                                      labels = agelabels1)]

#--------区县重赋值---------------

#install.packages("car")
Totaldeath12$qdis<-car::recode(Totaldeath12$x146,"'黄浦区'=101;
                                                  '徐汇区'=104;
                                                  '长宁区'=105;
                                                  '静安区'=106;
                                                  '普陀区'=107;
                                                  '虹口区'=109;
                                                  '杨浦区'=110;
                                                  '闵行区'=112;
                                                  '宝山区'=113;
                                                  '嘉定区'=114;
                                                  '浦东新区'=115;
                                                  '金山区'=116;
                                                  '松江区'=117;
                                                  '青浦区'=118;
                                                  '奉贤区'=120;
                                                  '崇明区'=151")

Totaldeath12<- Totaldeath12 %>% filter(qdis=='107')
attach(Totaldeath12)
table(x120,x121,useNA = "ifany")


、
#----------年龄计算是否一致--------------
Totaldeath_agenot<-Totaldeath12 %>% filter(x29=="岁",agea!=x28)%>%
  mutate(wrongre="年龄计算错误")
table(Totaldeath_agenot$qdis)


Totaldeath_monthnot<-Totaldeath12 %>% 
  mutate(aged=calaged(x26,x27),agem=calagem(x26,x27))%>% 
  filter(x29=="月",agem!=x28,aged>28)%>% 
  mutate(wrongre="年龄月计算错误")
rm(Totaldeath_monthnot)
Totaldeath12_daynot
table(Totaldeath_monthnot$qdis)
rm(Totaldeath_monthnot)  

Totaldeath12_daynot<-Totaldeath12 %>% 
  mutate(aged=calaged(x26,x27))%>% 
  filter(x29=="天",aged!=x28) %>% 
  mutate(wrongre="年龄日计算错误")
rm(Totaldeath12_daynot) 
table(Totaldeath12_daynot$qdis)
#rm(Totaldeath12_daynot)  



#--------查重---------------------
class(Totaldeath12$x26)

library(dplyr)
Totaldeath12_dup<-Totaldeath12 %>% 
  group_by(x5,x6,x26,x27) %>% 
  mutate(index = n()) %>%
  filter(index > 1) %>%
  arrange(desc(x4))%>%
    ungroup() %>%
  mutate(wrongre="重复数据")


table(Totaldeath12_dup$x120)
write.xlsx(Totaldeath12,"/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/2020年1-12月所有死亡.xlsx")
names(Totaldeath12_dup)[1:146]<-cols
write.xlsx(Totaldeath12_dup,"/Volumes/CL 工作硬盘/scdc信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/2020年截止12月数据库重复.xlsx")



#--------非婴儿但身份证空值---------
library(stringr)

Totaldeath_nullid<-filter(Totaldeath12,is.na(Totaldeath12$x12)&Totaldeath12$agea>1) %>%
  filter(!stringr::str_detect(x5,"[名]")) %>%
  mutate(wrongre="非婴儿但身份证空值")

#names(Totaldeath_nullid)[1:146]<-cols
table(Totaldeath_nullid$qdis)



#--------统计分类号有空值----------
Totaldeath12$x124<-as.numeric(Totaldeath12$x124)
Totaldeath_nuCCD<-filter(Totaldeath12,is.na(Totaldeath12$x124)|Totaldeath12$x124=="NULL") %>% 
        mutate(wrongre="统计分类号有空值")
table(Totaldeath_nuCCD$qdis)
#--------五岁以下儿童------
Totaldeath_under5<-filter(Totaldeath12,Totaldeath12$agea<5&Totaldeath12$x125=="否") %>%#年龄5岁以下，“是否五岁以下儿童”填的是否
  mutate(wrongre="年龄5岁以下，'是否五岁以下儿童'填的是否")
table(Totaldeath_under5$qdis)

#------------<1岁但是编号“是否婴幼儿”为否----------------
Totaldeath_infant <- filter(Totaldeath12,agea<1&x23!="是")%>%
  mutate(wrongre="<1岁但是编号“是否婴幼儿”不为是")
table(Totaldeath_infant$qdis)


#-------------小概率-----------------------------------

Totaldeath_a68<-filter(Totaldeath12,agea<15|agea>50,x124<=82,x124>=76)%>% #〔实足年龄〕＜15岁或＞50岁的妇女，〔任何ICD编码〕为孕产妇疾病，
  mutate(wrongre="非育龄妇女的孕产妇疾病")


Totaldeath_a70<-subset(Totaldeath12,grepl("Y87.2|S|T|Y1|Y2|Y30|Y31|Y32|Y33|Y34",Totaldeath12$x83))%>%
  mutate(wrongre="伤害无外部原因或意图不明")
table(Totaldeath_a70$qdis)


Totaldeath_a72<-filter(Totaldeath12,grepl("J96|K72|N17|N18|N19",Totaldeath12$x83)) %>%
  mutate(wrongre="呼衰、肝衰、肾衰")
table(Totaldeath_a72$qdis)

(pattern = "Totaldeath_")




#-----------------------2020年数据审核---来自于deathreg---------------------------------
table(Totaldeath12$x86)
death_aa<-subset(Totaldeath12,grepl("据病史调整",Totaldeath12$x86)) %>% mutate(wrongre="病史重新调查填写")
table(death_aa$x83)        

#-------性别疾病不匹配------
qc_1<-Totaldeath12 %>%
      filter(x124>=76&x124<=82,x6==1|x6==2&x124==75)%>%
  mutate(wrongre="性别疾病不匹配")
  


#-----------脑梗缺乏诊断意义---------------

qc_3<-Totaldeath12 %>%
  filter(x79=="05"|x79=="06") %>%
  filter(grepl("I63",x83)) %>%
mutate(wrongre="脑梗缺乏诊断意义")
table(qc3$qdis) 

table(Totaldeath12$x79,Totaldeath12$x80)
#----------心梗死后推断-----------、
qc_4<-Totaldeath12 %>%
  filter(x79=="06",x124==52)  %>%
mutate(wrongre="心梗死后推断")
table(qc4$qdis) 

#----------肿瘤编码不为根本死因------------
#还没找到 不知道代码有没有错

qc_5<-Totaldeath12 %>%
  filter(!grepl("B24",x83)) %>%
  filter(x124<17|x124>36) %>%
  filter(x57>="C00"&x57<"C99"|x57>="D00"&x57<"D49"|
         x60>="C00"&x60<"C99"|x60>="D00"&x60<"D49"|
         x63>="C00"&x63<"C99"|x63>="D00"&x63<"D49"|
         x66>="C00"&x66<"C99"|x66>="D00"&x66<"D49")%>%
mutate(wrongre="肿瘤编码不为根本死因?")


#--------院内死亡 结核为第二部分死因----------
qc_6<-Totaldeath12 %>%
filter(x30=="01") %>%
  filter(x69>="A15"&x69<"A19"|x71>="A15"&x71<"A19"|x73>="A15"&x73<"A19")%>%
  mutate(wrongre="院内死亡 结核为第二部分死因")


#--------重复编码---------- 

#qc_7<-Totaldeath12 %>%
 # filter(substr(x57,1,3)==substr(x60,1,3)|substr(x57,1,3)==substr(x63,1,3)|
  #       substr(x57,1,3)==substr(x66,1,3)|substr(x57,1,3)==substr(x69,1,3)|
   #      substr(x60,1,3)==substr(x63,1,3)|substr(x60,1,3)==substr(x66,1,3)|
    #     substr(x60,1,3)==substr(x69,1,3)|substr(x63,1,3)==substr(x66,1,3)|
    #     substr(x63,1,3)==substr(x69,1,3)|substr(x66,1,3)==substr(x69,1,3))%>%
#mutate(wrongre="重复编码")

#--------病房内死亡死因不明或高血压---------- 
qc_8<-Totaldeath12 %>%
  filter(x30=="01") %>%
  filter(grepl("I10|R",x83))%>%
  mutate(wrongre="病房内死亡死因不明或高血压")

#-------伤害无对应-------------
qc_9<-Totaldeath12 %>%
  filter(x124>=92&x124<=104,x57>="S00"&x57<"T99",x60>="S00"&x60<"T99",x63>="S00"&x63<"T99",
        x66>="S00"&x66<"T99",x69>="S00"&x69<"T99",x71>="S00"&x71<"T99",x73>="S00"&x73<"T99")%>%
  mutate(wrongre="伤害无对应")

#-------百岁已婚-------------
qc_10<-Totaldeath12 %>%
 filter(agea>=100,x13=="20")%>%
 mutate(wrongre="百岁已婚")

#------01－编码逻辑11-婚姻、学历、最高诊断依据为“不祥”------------
table(x15,useNA = "ifany")
qc_11<-Totaldeath12 %>%
  filter(x13=="90"|x15=="90"|x79=="07"|x79=="NULL"|is.na(x79))%>%
  mutate(wrongre="婚姻、学历、最高诊断依据为“不祥”或“其他”")

table(x79,useNA = "ifany")
tables(x79,x80)
#-------01－编码逻辑12-非当年死亡---------------
#qc_12<-Totaldeath12 %>%
#  filter(lubridate::year(x27)!=2020)%>%
 # mutate(wrongre="非当年死亡")

#-------01－编码逻辑13-低龄老衰死亡----------
qc_13<-Totaldeath12 %>%
  filter(agea<75)%>%
  filter(grepl("R54",x83)) %>%
  mutate(wrongre="低龄老衰死亡")

#------01－编码逻辑14-伤害无内因----------
qc_14<-Totaldeath12 %>%
  filter(x83>="V01",x57>="V01"&x57<"R99",x60>="V01"&x60<"R99",x63>="V01"&x63<"R99",
         x66>="V00"&x66<"R99")%>%
  mutate(wrongre="伤害无内因")

  
#------01－编码逻辑15-伤害无外部原因------
qc_15<-Totaldeath12 %>%
    filter(x83>="Y10"&x83<="Y34"|x83=="Y87.2"|grepl("S|T",x83))%>%
  mutate(wrongre="伤害无外部原因")
    
#------01－编码逻辑16-I69错误编码------
qc_16<-Totaldeath12 %>%
    filter(grepl("I69",x83),x57>"I61"&x57<"I68"|x60>"I61"&x60<"I68"|
             x63>"I61"&x63<"I68"|x66>"I61"&x66<"I68")  %>%
  mutate(wrongre="16-I69错误编码")

#-----02－零概率01-年龄≥120-----------
Totaldeath_a1<-filter(Totaldeath12,Totaldeath12$agea>=120)%>%
  mutate(wrongre="年龄≥120")  #年龄>=120岁
  
#-----02－零概率02-婴儿、弱智非文盲--------
    #------------〔弱智〕为“是”，〔文化程度〕不是“90-其他”------
Totaldeath_a8A<-filter(Totaldeath12,agea<1|x25=="是",x15!="90")%>%
    mutate(wrongre="婴儿、弱智非文盲")
  table(Totaldeath_a8A$qdis)

#-------  02－零概率03-学生学历文盲或不详-------
  #------------〔从业状况〕为“学生”者，〔文化程度〕为“90-其他”--------   
Totaldeath_a9<-filter(Totaldeath12,x20=="31",x15=="90")%>%
    mutate(wrongre="学生学历文盲或不详")
  table(Totaldeath_a9$qdis)
  
#-------   02－零概率04-<6岁非文盲---------
Totaldeath_a66<-filter(Totaldeath12,agea<6,x15!="90")%>% #〔实足年龄〕＜6岁者，〔文化程度〕不是“90-其他”
    mutate(wrongre="＜6岁非文盲")
  
  
#-------   02－零概率05-<18岁非未婚-----------
Totaldeath_a67a<-filter(Totaldeath12,agea<20,x13!="10")%>% #〔实足年龄〕＜18岁者，〔婚姻状况〕不为“未婚”者
    mutate(wrongre="＜20岁非未婚")  
  table(Totaldeath_a67$qdis)
  
#------------02－零概率06-〔性别〕为男性者，〔任何ICD编码〕为女性疾病，除前列腺疾病以外--------   
  

  Totaldeath_a11<-Totaldeath12 %>%
    filter(x6=="1")%>%
    filter(grepl("A34|B37.3|C79.6|D06|D39|E28|E89.4|
                  F52.5|F53|I86.3|L29.2|L70.5|M80.0|M80.1|
                  M81.0|M81.1|M83.0|N99.2|
                  N99.3|O|P54.6|R87|S31.4|
                  T19.2|T19.3|T83.3|Y76|Z01.4|Z12.4|Z30.1|
                  Z30.3|Z30.5|Z31.1|Z31.2|Z39|Z43.7|Z87.5|Z97.5",x83)|
                  x83>="C51"&x83<"C59"|
                  x83>="D06"&x83<="D07.3"|x83>="D25"&x83<"D29"|
                  x83>="N70"&x83<"N99"| x83>="Q50"&x83<"Q53"|
                  x83>="S37.4"&x83<"S37.6"|
                  x83>="Z32"&x83<"Z37")%>%
  mutate(wrongre="〔性别〕为男性者，〔任何ICD编码〕为女性疾病，除前列腺疾病以外")  

  Totaldeath_a11a<-Totaldeath12 %>%
    filter(x6=="1")%>%
    filter(grepl("A34|B37.3|C79.6|D06|D39|E28|E89.4|
                  F52.5|F53|I86.3|L29.2|L70.5|M80.0|M80.1|
                  M81.0|M81.1|M83.0|N99.2|
                  N99.3|O|P54.6|R87|S31.4|
                  T19.2|T19.3|T83.3|Y76|Z01.4|Z12.4|Z30.1|
                  Z30.3|Z30.5|Z31.1|Z31.2|Z39|Z43.7|Z87.5|Z97.5",x57)|
                 x57>="C51"&x57<"C59"|
                 x57>="D06"&x57<="D07.3"|x57>="D25"&x57<"D29"|
                 x57>="N70"&x57<"N99"| x57>="Q50"&x57<"Q53"|
                 x57>="S37.4"&x57<"S37.6"|
                 x57>="Z32"&x57<"Z37")%>%
     mutate(wrongre="〔性别〕为男性者，〔任何ICD编码〕为女性疾病，除前列腺疾病以外")  
  
#------------ 02－零概率07-不适用于女性的编码--------------------

 Totaldeath_a25_56<-Totaldeath12 %>%
    filter(x6=="2")%>%
    filter(grepl("B26.0|D17.6|D29|D40|E29|E89.5|
                  F52.4|I86.1|L29.1|R86|S31.2|S31.3|Z12.5",x83)|
                  x83>="C60"&x83<"C64"|
                  x83>="N40"&x83<="N51.8"|
                  x83>="D07.4"&x83<="D07.6"|
                  x83>="Q53"&x83<"Q56")%>%
    mutate(wrongre="不适用于女性的编码")  
  
#------------   02－零概率08-非育龄妇女的孕产妇疾病--------------
qc2_08<-Totaldeath12 %>%
    filter(x6=="2")%>%
    filter(agea<15|agea>50,x124>=76&x124<=82) %>%
    mutate(wrongre="非育龄妇女的孕产妇疾病")#Deathreg 里ccd码是109分类的，不对；应以104为准
  
#------------  02－零概率09-病房急诊无医院-----------------------
qc2_09<-Totaldeath12 %>%
    filter(x30=="01"|x30=="02",is.na(x74))%>%
    mutate(wrongre="病房急诊无医院")  
   
#--------------02－零概率11-死亡日期早于出生日期----------------
  Totaldeath_a4<-filter(Totaldeath12,Totaldeath12$x27<Totaldeath12$x26)%>%
    mutate(wrongre="死亡日期早于出生日期")  #死亡日期早于出生日期

  
#------------  02－零概率12-填报日期早于死亡日期  ---------------
  
  Totaldeath12$x110<-lubridate::ymd(Totaldeath12$x110)
  Totaldeath12$x113<-lubridate::ymd(Totaldeath12$x113)
  
  Totaldeath_a3<-filter(Totaldeath12,Totaldeath12$x110<Totaldeath12$x26|
                          Totaldeath12$x113<Totaldeath12$x26)%>% #填报日期早于死亡日期
    mutate(wrongre="填报日期早于死亡日期")
  table(Totaldeath_a3$qdis)
  
#---------------02－零概率13-根本死因为星号编码2---------------------

qc2_13<-Totaldeath12 %>%
  filter(grepl("I68|I79|I98|J17|J91|J99|K23|K67|K77|
               K87|K93|L14|L45|L54|L62|
               L86|L99|M01|M03|M07|M09|
               M14|M36|M49|M63|M68|M73|
               M82|M90|N08|N16|N22|N29|
               N33|N37|N51|N74|N77|P75",x83))%>%
  mutate(wrongre="填报日期早于死亡日期")
        
#---------------02－零概率14-不允许为死后推断------------------

Totaldeath_a69 <- Totaldeath12 %>% 
    filter(x79=="06")%>% 
    filter(x124>=2&x124<=41|x124>=44&x124<=46|x124>=70&x124<=75| 
             x124>=86&x124<=88| x124>=91&x124<=104)%>%
    mutate(wrongre="不允许死后推断的疾病")
  table(Totaldeath_a69$qdis)
  
#---------------02－零概率15-I10～心脏病冲突----------------
  qc2_15 <- Totaldeath12 %>% 
    filter(x83>="I51.4"&x83<="I51.9")%>% 
    filter(x57=="I10"|x60=="I10"|x63=="I10"|x66=="I10")%>%
    mutate(wrongre="I10心脏病冲突")
    

#------------  02－零概率16-I21伴I22-------------------------
  qc2_16<- Totaldeath12 %>% 
      filter(grepl("I22",x57)|grepl("I22",x60)|grepl("I22",x63)|grepl("I22",x66))%>% 
      filter(grepl("I21",x83),x30=="01"|x30=="02")%>% 
    mutate(wrongre="I21伴I22")
    
#------------ 02－零概率16-根本死因应为急性心梗------------------
 qc2_16a<- Totaldeath12 %>% 
      filter(grepl("I22|I21",x57)|grepl("I22|I21",x60)|
            grepl("I22|I21",x63)|grepl("I22|I21",x66)) %>% 
      filter(x83>="I24"&x83<"I28",x30=="01"|x30=="02")%>% 
      mutate(wrongre="根本死因应为急性心梗")

#------------ 02－零概率17-伤害内外因时间对应错误 -----------------
qc2_17a<- Totaldeath12 %>% 
     filter(x83>="V00"&x83<"Y85",x57>="T90"&x57<"T98"|x60>="T90"&x60<"T98"|x63>="T90"&x63<"T98"|x66>="T90"&x66<"T98")%>% 
      mutate(wrongre="伤害内外因时间对应错误")
qc2_17b<- Totaldeath12 %>% 
     filter(x83>="Y85",x57>="S00"&x57<"T90"|x60>="S00"&x60<"T90"|x63>="S00"&x63<"T90"|x66>="S00"&x66<"T90")%>% 
      mutate(wrongre="伤害内外因时间对应错误") 


#------------ 02－零概率18-症状或体征------------
qc2_18<- Totaldeath12 %>% 
  filter(grepl("J96|K72",x83))%>% 
  mutate(wrongre="症状或体征")

#------------02－零概率19-心血管病缺乏诊断意义-------

Totaldeath_a71<-Totaldeath12 %>%
  filter(grepl("I47.2|I49.0|I46|I50|I51.4|I51.5|I51.6|I51.9|I70.9",x83))%>% 
  filter(grepl("05|06|07|NULL",x79)|is.na(x79))%>% 
  filter(x30=="01"|x30=="02"|x30=="06")%>%
   mutate(wrongre="心血管病缺乏诊断意义")
   
#------------02－零概率20-高血压性心脏、肾脏病的联合编码错误------------
   
q2_20<-Totaldeath12 %>% 
  filter(x83=="I11.9"|x83=="I12.9"|x83=="I13.9") %>%
  filter(x57>="I50"&x57<"I51"|x60>="I50"&x60<"I51"|x63>="I50"&x63<"I51"|x66>="I50"&x66<"I51"|
        x57>="N17"&x57<"N20"|x60>="N17"&x60<"N20"|x63>="N17"&x63<"N20"|x66>="N17"&x66<"N20" )%>% 
     mutate(wrongre="高血压性心脏、肾脏病的联合编码错误")  
 
#------------02－零概率21-根本死因为高血压 --------不太适合做零概率-------------------------
q2_21<-Totaldeath12 %>% 
     filter(grepl("I10",x83)) %>%
     filter(!str_detect(x57, "K92.2|I99|I10|R54|R96|R98|R99|J96.9|R63|R40.2"))%>% 
     mutate(wrongre="根本死因为高血压需讨论")  

#------------ 02－零概率23-根本死因为继发癌症------------------------------
q2_23<-Totaldeath12 %>% 
       filter(grepl("C79|C78|C77",x83))%>%
       filter(!grepl("C77.9",x83)) %>%
       mutate(wrongre="根本死因为继发癌症")

     
#------------ 02－零概率24-身份证出生日期不对应-------------------------------
     library(stringr)
  Totaldeath_a2<-Totaldeath12 %>% filter(is.na(x12)==FALSE,x11=="身份证")%>%
                                    mutate(sr=str_replace_all(x26,'-','')) %>%
                                    mutate(zs=str_sub(x12,7,14))%>%
                                    filter(zs!=sr)%>%
    mutate(wrongre="身份证出生日期不对应")

     
#------------ 02－零概率25-其他不能做根本死因的编码 -----------------------------
 q2_25<-Totaldeath12 %>% 
       filter(grepl("I25.2|H",x83))%>%
       mutate(wrongre="其他不能做根本死因的编码")

#------------ 03－小概率01-≥28天新生儿病------------------------

   Totaldeath_a73<-Totaldeath12 %>% 
       mutate(agem=calagem(x26,x27))%>% 
       filter(x29!='天'|agea>=1)%>%
       filter(x124>=83&x124<=85)%>%
       mutate(wrongre="≥28天新生儿病")
     table(Totaldeath_a73$qdis)
     

 #--------------03－小概率02-<15岁结核等疾病--------------------
Totaldeath_a74<-Totaldeath12 %>% 
       filter(agea<15)%>% 
       filter(x124==6|x124==103|x124>=18&x124<=34|x124>=41&x124<=43|
              x124>=48&x124<=57| x124>=60&x124<=62)%>%
       mutate(wrongre="＜15岁结核等疾病")
     table(Totaldeath_a74$qdis) 
     
     
#--------------03－小概率03-<20岁血吸虫病-----------------------
  Totaldeath_a75<-Totaldeath12 %>% filter(agea<20)%>% filter(x124==16)%>%
     mutate(wrongre="＜20岁血吸虫病")
     
#--------------03－小概率04-<45岁慢性下呼吸道疾病--------------------------
Totaldeath_a76<-Totaldeath12 %>% filter(agea<45)%>% filter(x124>=60&x124<=62)%>%
       mutate(wrongre="＜45岁慢性下呼吸道疾病")
     table(Totaldeath_a76$qdis)
     
#--------------03－小概率05-<50岁前列腺增生----------------------
 Totaldeath_a77<-Totaldeath12 %>% filter(agea<50)%>% filter(x124==75)%>%
       mutate(wrongre="<50岁前列腺增生")
     table(Totaldeath_a77$qdis)
     
#--------------03－小概率06-<5岁糖尿病或精神障碍 --------------------- 

Totaldeath_a78<-Totaldeath12 %>% filter(agea<5)%>% filter(x124>=41&x124<=43)%>%
       mutate(wrongre="＜5岁糖尿病或精神障碍")   
     
#--------------03－小概率07->40岁先天畸形------------------------------   
Totaldeath_a79<-Totaldeath12 %>% filter(agea>40)%>% filter(x124>=86&x124<=88)%>%
       mutate(wrongre="＞40岁先天畸形")
     table(Totaldeath_a79$qdis)    
     
#-------------- 03－小概率08-死在家中的传染病 ----------------------------
 Totaldeath_a80<-Totaldeath12 %>% filter(x29=="03")%>% filter(x124>=3&x124<=14)%>%
       mutate(wrongre="死在家中的传染病")
     table(Totaldeath_a80$qdis)  
     
#-------------- 03－小概率09-不适用于男性的编码----------------------------
     
Totaldeath_a63<-Totaldeath12 %>%
       filter(x6=="1")%>%
       filter(grepl("C50|D05|D24|D48.6|Q83",x83)|x83>="N60"&x83<"N65")%>%
  mutate(wrongre="不适用于男性的编码")
     
     
#--------------03－小概率10－职业年龄矛盾---------------------------
Totaldeath_a81<-Totaldeath12 %>% filter(agea>6,x22=="1"|x125=="是")%>% 
     mutate(wrongre="〔实足年龄〕＞6岁，〔婴幼儿、学龄前儿童〕为“是”")

Totaldeath_a81b<-Totaldeath12 %>% filter(agea>30)%>% filter(x21=="学生")%>%
       mutate(wrongre="〔实足年龄〕＞30岁，〔从业状况〕为“学生”")
     table(Totaldeath_a81b$qdis)
     
Totaldeath_a81c<-Totaldeath12 %>% filter(agea>60)%>% filter(x21=="无业人员")%>%
       mutate(wrongre=" 〔实足年龄〕＞60岁，〔从业状况〕为“无业人员”")
     table(Totaldeath_a81c$qdis) 
#--------------03－小概率11－其他应核实疾病------------------------
qc3_11<-Totaldeath12 %>% 
     filter(grepl("D48.9|Y59.0|J69.0|E87|K56.7|J31|A81.0|I20",x83))%>%
       mutate(wrongre="其他应核实疾病")  
     
#-------------死因提及,根本死因不为HIV-------------------------
 qc2_18<- Totaldeath12 %>%  
   filter(x57>="B20"&x57<"B25"|x60>="B20"&x60<"B25"|
          x63>="B20"&x63<"B24"|x66>="B20"&x66<"B25",x124!="14")%>%
   mutate(wrongre="死因提及,根本死因不为HIV") 
   


 #-----合并所有符合条件的数据框-----------------
     temp<-ls(pattern = "_")[-1]
     temp<-temp[-1]
     merge.data = get(temp[1])
     
     merge.data$x110<-as.character(merge.data$x110)
     merge.data$x113<-as.character(merge.data$x113)
     merge.data$x124<-as.character(merge.data$x124)
     for (i in 2:length(temp)){
       new.data = get(temp[i])
       new.data$x25<-as.character(new.data$x25)
       new.data$x124<-as.character(new.data$x124)
       new.data$x113<-as.character(new.data$x113)
       new.data$x110<-as.character(new.data$x110)
       merge.data = bind_rows(merge.data,new.data)
     }
     
     
     re<-as.data.frame(table(merge.data$qdis,merge.data$wrongre,useNA = "ifany"))
    names(merge.data) [1:146]<-cols
     write.xlsx(merge.data,"/Volumes/CL 工作硬盘/SCDC信息所/各区工作一览表/2020死亡报卡一览表/每月上交数据/12月/所有审核有问题的数据107.xlsx")
     
     outall<-all %>% dplyr::select(x1:x145,wrongre,x124,审核区县)
     
     
  #-------垃圾码---------
     library(stringr)
     Totaldeath_a82<-filter(Totaldeath12,grepl("R",Totaldeath12$x83)) %>%
       mutate(wrongre="死因不明")
     table(Totaldeath_a82$qdis)
     
     Totaldeath_a82b<-Totaldeath_a82[str_detect(Totaldeath_a82$x83,"[^R95]"),]%>%
       mutate(wrongre="去除R95的死因不明")
     table(Totaldeath_a82b$qdis)
     
     gar<-read_excel("C:/Users/cl/Desktop/tips/2017 ICD-GBD/ICD10-GBD2017 mort.xlsx")
     
     da<-left_join(Totaldeath12,gar,by=c("x83"="icd_code"))
     Totaldeath_gar<-filter(da,da$gbd_cause=="_gc") %>% mutate(wrongre="所有垃圾编码")
     
     table(Totaldeath12$qdis)
     
     library(ggplot2)
     library(dplyr)
     library(plyr)
     library(reshape)
     library(dygraphs)
     library(ggsci)      
     library(gridExtra)
     library(ggthemes)  #主题包
     library(ggpubr)
     library(tidyverse) 
     library(geojsonio) #读取地图数据
     library(magrittr)
     library(rgdal)
     library(pyramid)
     
     
     library(geojsonio)
     url <- "https://geo.datav.aliyun.com/areas_v2/bound/310000_full.json" #①
     SD <- geojson_read(url, parse = TRUE, what = "sp")#geojsonio包
     Shanghai_map <- fortify(SD) #地理信息边界数据
     SD@data$name<-as.character(SD@data$name) #提取出各区的名称
     #Encoding(BJ@data$name) <- "UTF-8" ##乱码问题
     x<-SD@data[,1:2] #行政数据
     xx<-data.frame(x,id=seq(1:16))  #②不同的省市地区序号id不同
     case<-as.data.frame(table(Totaldeath_gar$x145))
     
     
     #(2)制作数据
     # 制作云业务数据
     library(dplyr)
     
     dat1<-inner_join(xx,case,by=c("name"="Var1"))
     names(dat1)[4]<-"case"
     
     dedi<-as.data.frame(table(Totaldeath12$x145))
     dat2<-inner_join(dat1,dedi,by=c("name"="Var1"))
     
     dat2$per<-dat2$case/dat2$Freq*100
     library(plyr)
     SDmap<-join(dat2,Shanghai_map,type="full")
     summary(SDmap$per)
     #(3)数据分组，用于等级填充
     SDmap$group1<-cut(SDmap$per,breaks = c(0,5,7,10,15,20,Inf),
                       labels = c("0-5%","5%-7%","7%-10%","10%-15%","15%-20%","高于20%"),
                       include.lowest = T,right = T)
     
     table(SDmap$group1)
     
     midpos<-function(x) mean(range(x,na.rm = T))
     centres <-ddply(SDmap,.(name),colwise(midpos,.(long,lat)))
     
     
     #颜色
     display.brewer.pal(9, "BuGn")
     
     #(5)绘制等级地图
     ggplot(SDmap,aes(x=long,y=lat))+
       geom_polygon(aes(group=group,fill=group1),col="grey40",size=0.2)+
       geom_text(data=centres,aes(x=long,y=lat,label=name),size=4,
                 fontface="bold")+ #ggrepel::geom_text_repel()
       scale_fill_brewer(palette ='BuGn' )+
       labs(title="2020年1-12月上海市不同地区垃圾编码报告等级地图")+
       theme(legend.position = c(0.95,0.25),  ##图例的位置
             panel.background = element_blank(), ##图背景
             plot.title= element_text(hjust = 0.5,size =rel(2),face = "bold"),##调整标题的位置和字体的大小\粗细
             panel.grid = element_blank(), ##去掉网格线
             axis.text = element_blank(),  ##坐标轴上字体
             axis.ticks = element_blank(), ##坐标轴上刻度
             axis.title = element_blank())+ ##坐标轴上标题
       labs(fill = "死亡垃圾编码比例（%）")
     
     temp<-ls
     