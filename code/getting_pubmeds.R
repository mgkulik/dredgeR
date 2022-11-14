library(easyPubMed)

comp_path <- "/home/magoncal/Documents/data/projects/pubmed_search/"

data_pubmed <- read.csv(paste0(comp_path, 'csv-intrinsicd-set.csv'), stringsAsFactors=FALSE)

my_query <- '(("intrinsic disorder") OR ("intrinsically disordered")) AND (("2021/01/01"[Date - Publication] : "2022/11/14"[Date - Publication]))' 
my_entrez_ids <- get_pubmed_ids(my_query)
my_abstracts_xml <- fetch_pubmed_data(pubmed_id_list = my_entrez_ids)
my_abstracts_list <- articles_to_list(my_abstracts_xml)
for (i in 1:length(my_abstracts_list)) {
  print(i)
  temp_df <- article_to_df(my_abstracts_list[[i]], autofill = TRUE)
  if (i==1){
    df_pubmed <- temp_df
  } else {
    df_pubmed <- rbind(df_pubmed, temp_df)
  }
}
